import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/countdown_page.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/view/patternIntroductionView.dart';

import '../constants.dart';
import 'choose_difficulty_page.dart';


// 选择模式界面（L1 L2 L3）
class Selectionmodepage extends StatefulWidget {
  const Selectionmodepage({super.key});

  @override
  State<Selectionmodepage> createState() => _SelectionmodepageState();
}

class _SelectionmodepageState extends State<Selectionmodepage> {
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
                              child: Constants.boldBaseTextWidget("Level", 22)
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
                                height: 24,
                                child: Center(
                                  child: Image.asset('images/new_mode/lock_icon.png',
                                      width: 24, height: 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 36,),
                  Container(
                    margin: EdgeInsets.only(left: 24,right: 24 ),
                    height: 130,
                    child: Patternintroductionview(title: "LV.1",introduction: "Follow the light cues \n "
                    "and quickly hit the"
                    "targets with \naccuracy within a limited time."),
                  ),

                  SizedBox(height: 24,),
                  Container(
                    margin: EdgeInsets.only(left: 24,right: 24 ),
                    height: 130,
                    child: Patternintroductionview(title: "LV.2",introduction: "Hit the targets \n"
                        "according to the light signals\n to evaluate"
                        " your training level.",),
                  ),

                  SizedBox(height: 24,),
                  Container(
                    margin: EdgeInsets.only(left: 24,right: 24 ),
                    height: 130,
                    child: Patternintroductionview(title: "LV.3",introduction: "Complete the target-hitting\n "
                        "training by following the light \n cues as the robot rotates.",),
                  ),

                  SizedBox(height: 24,),
                  Container(
                    margin: EdgeInsets.only(left: 39,right: 39),
                    child: Constants.regularWhiteTextWidget("Advanced difficulty "
                        "levels are unlocked as "
                        "you progress in training.", 16, Colors.white,textAlign: TextAlign.left,height: 1.2),
                  ),

                  SizedBox(height: 37,),

                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountdownPage()), //
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
                          child: Constants.mediumWhiteTextWidget("START", 18, Colors.white),
                        )
                    ),
                  ),

                  SizedBox(height: 10,),
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
                          color: Color.fromRGBO(45, 45, 57, 1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Constants.mediumWhiteTextWidget("Reselect", 18,
                              Color.fromRGBO(169, 169, 169, 1)),
                        )
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          )
      ),
    );
  }
}
