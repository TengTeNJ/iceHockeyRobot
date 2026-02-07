import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/choose_difficulty_page.dart';

import '../constants.dart';
import '../p1mode/p1mode_gaming_controller.dart';

/// 模式启动页
class ModeStartuppage extends StatefulWidget {
  const ModeStartuppage({super.key});

  @override
  State<ModeStartuppage> createState() => _ModeStartuppageState();
}

class _ModeStartuppageState extends State<ModeStartuppage> {
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
                              child: Constants.boldBaseTextWidget("P1 Mode", 22)
                          ),
                        ),
                        // 3️⃣ 右侧占位（空 Expanded 即可，权重 1）
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    ),
                  ),

                  SizedBox(height: 84,),
                  Container(
                    width: 252,
                    height: 252,
                    child: Image.asset("images/new_mode/p1_mode_icon.png",width: 149,),
                  ),
                  SizedBox(height: 59,),

                  Container(
                    // color: Colors.red,
                     margin: EdgeInsets.only(left: 26),
                    alignment: Alignment.centerLeft,  // 或者移除这行，直接设置 width
                    child: Constants.boldWhiteTextWidget("Mode 1", 40,textAlign: TextAlign.left),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 26,right: 26),
                    child: Constants.regularWhiteTextWidget("Head to a 3-minute solo training "
                        "session. Be sure to watch for the "
                        "robot's flashing lights and complete "
                        "precise passing drills.", 16, Colors.white,textAlign: TextAlign.left,height: 1.2),
                  ),

                  SizedBox(height: 107,),

                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseDifficultyPage()), //
                    );
                  },
                   child:Container(
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
