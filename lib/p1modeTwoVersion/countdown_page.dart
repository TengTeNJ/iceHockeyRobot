import 'dart:async';
import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/p1_gaming_page.dart';
import '../constants.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  int count = 3;
  bool isShowGo = false;
  bool countDownIsEnd = false;
  Timer ? countDownTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDownTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) async{
      if (count == 1) {
        countDownTimer?.cancel();
        isShowGo = true;
        setState(() {});
        Timer timer = Timer.periodic(Duration(milliseconds: 1000), (timer) async {
          timer.cancel();
          countDownIsEnd = true;
          setState(() {});
        });

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => P1GamingPage()), //
        );
        return;
      }
      count --;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Constants.newDarkControllerColor,
        body:SingleChildScrollView(
          child:Column(
              children: [
                SizedBox(height: (Constants.screenHeight(context) - 500) / 2,),
                Center(
                  child: Stack(
                      alignment: Alignment.center, // 关键：Stack 内容居中
                      children: [
                        // 背景图
                        Image.asset(
                          "images/new_mode/circle_count_down.png",
                          width: 500,
                          height: 500,
                          fit: BoxFit.fitWidth,
                        ),

                        // 文字居中显示，不需要 Positioned
                        Container(
                          width: 233,
                          height: 233,
                          alignment: Alignment.center, // 文字在 Container 中居中
                          // color: Colors.red, // 调试用，确认位置，完成后可删除
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 156,
                              fontFamily: "SanFranciscoDisplay",
                              height: 1.0,
                              leadingDistribution: TextLeadingDistribution.even,
                              color: Color.fromRGBO(241, 95, 8, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
