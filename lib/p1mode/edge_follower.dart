import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class EdgeFollower extends StatefulWidget {
  const EdgeFollower({super.key});

  @override
  State<EdgeFollower> createState() => _EdgeFollowerState();
}

class _EdgeFollowerState extends State<EdgeFollower> {
  /// 陀螺仪角速度
  double _gx = 0, _gy = 0;

  /// 当前累计角度（弧度）
  double _angleX = 0, _angleY = 0;

  /// 低通滤波系数
  final double _alpha = 0.4;

  /// 最大允许角度（角度制，可调）
  final double _maxAngle = 15; // ±15° 时图片顶到边

  /// 图片放大比例
  final double _scale = 1.4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听陀螺仪（rad/s）
    gyroscopeEvents.listen((GyroscopeEvent event) {
      // 低通滤波
      _gx = _alpha * _gx + (1 - _alpha) * event.x;
      _gy = _alpha * _gy + (1 - _alpha) * event.y;

      // 简单积分：角度 += 角速度 * 时间间隔
      // 实际间隔约 16ms（60Hz），这里用固定值简化
      const dt = 0.016;
      _angleX += _gx * dt;
      _angleY += _gy * dt;

      // 角度限幅，防止无限累加
      final maxRad = _maxAngle * math.pi / 180;
      _angleX = _angleX.clamp(-maxRad, maxRad);
      _angleY = _angleY.clamp(-maxRad, maxRad);
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    final h = mq.size.height;
    // 1. 角度 → 比例 [-1, 1]
    final ratioX = _angleX / (_maxAngle * math.pi / 180);
    final ratioY = _angleY / (_maxAngle * math.pi / 180);

    // 2. 比例 → 偏移量（单位：逻辑像素）
    // 图片被放大，最大可偏移 (scale-1)/2 * w/h
    final maxOffsetX = (_scale - 1) / 2 * w;
    final maxOffsetY = (_scale - 1) / 2 * h;
    const kDamp = 0.5;          // ← 0 不动，1 最灵敏，自己调

    final offsetX = ratioX * maxOffsetX* kDamp;
    final offsetY = ratioY * maxOffsetY* kDamp;

    return Center(
      child: ClipRect(
        child: SizedBox(
          width: w,
          height: h,
          child: Transform.translate(
            offset: Offset(offsetX, offsetY),
            child: Transform.scale(
              scale: _scale,
              child: const Center(
                child: Image(image: AssetImage("images/mode/robot_high_icon.png"),width: 200,), // 换成你的图片
              ),
            ),
          ),
        ),
      ),
    );
  }
}
