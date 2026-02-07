import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants.dart';

class CountdownTimer extends StatefulWidget {
  final void Function(String timeStr)? onTimeChanged;
  final void Function(Duration remaining)? onDurationChanged;
  final VoidCallback? onFinished;

  const CountdownTimer({
    Key? key,
    this.onTimeChanged,
    this.onDurationChanged,
    this.onFinished,
  }) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration _remaining = Duration(minutes: 3);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 先回调初始时间
    _notifyTimeChanged();
    // 启动定时器
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("倒计时开始");
      setState(() {
        if (_remaining.inSeconds > 0) {
          _remaining = _remaining - Duration(seconds: 1);
          _notifyTimeChanged();  // 每秒回调
        } else {
          _timer?.cancel();
          widget.onFinished?.call();
        }
      });
    });
  }

  void _notifyTimeChanged() {
    widget.onTimeChanged?.call(_formatTime(_remaining));
    widget.onDurationChanged?.call(_remaining);
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Constants.dsdigiTextWidget(
        _formatTime(_remaining),
        42,
      ),
    );
  }
}