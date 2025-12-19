import 'package:flutter/material.dart';
import '../constants.dart';

/// 数据结算界面
class P1modeSettlementController extends StatefulWidget {
  const P1modeSettlementController({super.key});

  @override
  State<P1modeSettlementController> createState() => _P1modeSettlementControllerState();
}

class _P1modeSettlementControllerState extends State<P1modeSettlementController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Constants.darkControllerColor,
        body:Column(
          children: [
            // 1️⃣ 左侧返回按钮
            Column(
              children: [
                SizedBox(          // 或者 ConstrainedBox
                  height: 100,      // 交叉轴方向钉死
                  child: Row(
                    children: [
                      Expanded(    // 现在它只能高
                        child: Container(
                          // color: Colors.red,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 19),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
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
                    ],
                  ),
                ),
                // 其它行/列子节点
              ],
            ),


            // SizedBox(height: 100,),

            Container(
              // color: Colors.grey,
                margin: EdgeInsets.only(top: 0),
                width:Constants.screenWidth(context) ,
                height: 200,
                child:Stack(
                  children: [
                    // 背景图
                    Image.asset(
                      "images/mode/celebrate_bg.png",
                      fit: BoxFit.fitWidth,
                      width: Constants.screenWidth(context),
                      height: 140,
                    ),

                    // 居中且底部超出
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 30,
                      bottom: -30,          // 负值即可超出
                      child: Center(
                        child: Image.asset(
                          "images/mode/celebrate_ok.png",
                          width: 140,
                          height: 140,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                )

            ),

            SizedBox(height: 20,),
            Constants.boldWhiteTextWidget("Good Job,Mike", 24),

            SizedBox(height: 73,),
            Constants.regularWhiteTextWidget("Parks", 16, Constants.baseGreyStyleColor),

            SizedBox(height: 4,),
            Constants.mediumWhiteTextWidget("40", 40, Colors.white),


            SizedBox(height: 16,),
            Center(
              child: Container(
                width: 181,
                height: 1,
                color: Color.fromRGBO(86, 86, 1161, 1),
              ),
            ),

            SizedBox(height: 16,),
            Constants.regularWhiteTextWidget("Reaction.Avg", 16, Constants.baseGreyStyleColor),

            SizedBox(height: 4,),
            Constants.mediumWhiteTextWidget("3.5s", 40, Colors.white),

            SizedBox(height: 16,),
            Center(
              child: Container(
                width: 181,
                height: 1,
                color: Color.fromRGBO(86, 86, 1161, 1),
              ),
            ),

            SizedBox(height: 16,),
            Constants.regularWhiteTextWidget("Rate", 16, Constants.baseGreyStyleColor),

            SizedBox(height: 4,),
            Constants.mediumWhiteTextWidget("68%", 40, Colors.white),
          ],
        ),
      ),
    );
  }
}
