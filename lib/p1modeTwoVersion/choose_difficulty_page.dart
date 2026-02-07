import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/selectionModePage.dart';

import '../constants.dart';

/// 选择难度page
class ChooseDifficultyPage extends StatefulWidget {
  const ChooseDifficultyPage({super.key});

  @override
  State<ChooseDifficultyPage> createState() => _ChooseDifficultyPageState();
}

class _ChooseDifficultyPageState extends State<ChooseDifficultyPage> {
  var threeGradientBorderThickness = 2.0;/// 3m的 渐变色的边框粗细 （选中为2，非选中为0）
  var fiveGradientBorderThickness = 0.0;/// 5m的 渐变色的边框粗细 （选中为2，非选中为0）


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
                              child: Constants.boldBaseTextWidget("Difficulty", 22)
                          ),
                        ),
                        // 3️⃣ 右侧占位（空 Expanded 即可，权重 1）
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    ),
                  ),

                  SizedBox(height: 84,),
                  Container(
                    width: 303,
                    height: 303,
                    child: Image.asset("images/new_mode/five_meters_icon.png"),
                  ),
                  SizedBox(height: 60,),
                  Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(left: 45,right: 45),
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){
                          print("点击 3m 的难度");
                          threeGradientBorderThickness = 2;
                          fiveGradientBorderThickness = 0;
                          setState(() {});
                          },
                          child:
                          Container(
                            width: 140,
                            height: 65,
                            padding: EdgeInsets.all(threeGradientBorderThickness), // 边框粗细
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [Color.fromRGBO(251, 92, 33, 1),Color.fromRGBO(248, 187, 21, 1)],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // 比外层小一点
                                color: Color.fromRGBO(45, 45, 57, 1), // 内部背景色
                              ),
                              child: Center(
                                child:Constants.boldWhiteTextWidget("3m", 30,textColor: Color.fromRGBO(241, 95, 8, 1.0)),
                              )
                            ),
                          ),
                        ),

                        SizedBox(width: 5,),
                        GestureDetector(onTap: (){
                          print("点击 5m 的难度");
                          threeGradientBorderThickness = 0;
                          fiveGradientBorderThickness = 2;
                          setState(() {});
                        },
                          child:
                          Container(
                            width: 140,
                            height: 65,
                            padding: EdgeInsets.all(fiveGradientBorderThickness), // 边框粗细
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [Color.fromRGBO(251, 92, 33, 1),Color.fromRGBO(248, 187, 21, 1)],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                              ),
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // 比外层小一点
                                  color: Color.fromRGBO(45, 45, 57, 1), // 内部背景色
                                ),
                                child: Center(
                                  child:Constants.boldWhiteTextWidget("5m", 30,textColor: Color.fromRGBO(241, 95, 8, 1.0)),
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ),

                  SizedBox(height: 50,),
                  Constants.regularWhiteTextWidget("For experienced trainees", 16, Colors.white,
                      textAlign: TextAlign.center),

                  SizedBox(height: 64,),

                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Selectionmodepage()), //
                    );
                  },
                   child: Container(
                       height: 50,
                       margin: EdgeInsets.only(left: 60,right: 60),
                       decoration: BoxDecoration(
                         color: Color.fromRGBO(241, 95, 8, 1),
                         borderRadius: BorderRadius.circular(14),
                       ),
                       child: Center(
                         child: Constants.mediumWhiteTextWidget("Continue", 18, Colors.white),
                       )
                   ),


                  )
                ],
              ),
            ),
          )
      ),
    );
  }

}
