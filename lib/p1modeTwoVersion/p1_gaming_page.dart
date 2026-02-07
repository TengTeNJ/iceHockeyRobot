import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/view/countdown_timer.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/view/robot_indicato_light_view.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/view/trainingSatesView.dart';
import 'package:icehockeyrobot/view/p1mode_countdown_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants.dart';

/// P1 游戏中
class P1GamingPage extends StatefulWidget {
  const P1GamingPage({super.key});

  @override
  State<P1GamingPage> createState() => _P1GamingPageState();
}

class _P1GamingPageState extends State<P1GamingPage> {
  /// 倒计时相关
  static const int _totalDurationMs = 60 * 3000; // 60 秒
  int currentSecond = 180;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Constants.darkControllerColor,
          body:
          GestureDetector(onTap: (){
            FocusScope.of(context).unfocus(); // 点击“完成”时收起
          },
            child: SingleChildScrollView(
              child:Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 58),
                    width: Constants.screenWidth(context),
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 1️⃣ 左侧返回按钮
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft, // 想靠左就 left
                            padding: const EdgeInsets.only(left: 19), // 代替原来的 margin
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Image.asset('images/mode/back_icon.png',
                                      width: 32, height: 30),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // 2️⃣ 中间图标
                        Expanded(
                          child: Center(
                              child: Constants.boldBaseTextWidget("", 22)
                          ),
                        ),
                        // 3️⃣ 右侧占位（空 Expanded 即可，权重 1）
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight, // 想靠左就 left
                            padding: const EdgeInsets.only(right: 24), // 代替原来的 margin
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 24,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Image.asset('images/new_home/battery_icon.png',
                                      width: 24, height: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32,),



                  Container(
                    child:
                    CountdownTimer(
                      onTimeChanged: (timeStr) {
                        print("当前时间: $timeStr");
                      },
                      onDurationChanged: (duration) {
                        print("剩余秒数: ${duration.inSeconds}");
                        currentSecond = duration.inSeconds;
                        Future.delayed(Duration(milliseconds: 1000), () {
                          setState(() {});
                        });
                      },
                      onFinished: () {
                        print("倒计时结束");
                      },
                    ),
                  ),
                  SizedBox(height: 27,),

                  Container(
                    // color: Colors.red,
                    child:new CircularPercentIndicator(
                      radius: 336/2,
                      lineWidth: 20.0,
                      percent: currentSecond /180.0,
                      center:P1modeCountdownView(),
                      backgroundColor: Color.fromRGBO(112, 112, 112, 1.0),
                      progressColor: Color.fromRGBO(241, 95, 8, 1.0),
                    ),
                  ),



                  SizedBox(height: 44,),
                  Container(
                    alignment: Alignment.center,
                    child: RobotIndicatoLightView(progress: 1,)
                  ),

                  SizedBox(height: 21,),

                  Container(
                    margin: EdgeInsets.only(left: 24),
                    width: Constants.screenWidth(context),
                    child: Constants.boldWhiteTextWidget("Training Sates", 16,textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 24,right: 24,top: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(241, 95, 8, 1),      // 边框颜色
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(16),  // 内边距：四边都是16
                    child: Trainingsatesview(),
                  ),
                  SizedBox(height: 53,),
                ],
              ),
            ),
          )
      ),
    );
  }
}
