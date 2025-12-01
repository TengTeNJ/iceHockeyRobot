import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1mode/p1mode_gaming_controller.dart';

import '../constants.dart';

class P1modeController extends StatefulWidget {
  const P1modeController({super.key});

  @override
  State<P1modeController> createState() => _P1modeControllerState();
}

class _P1modeControllerState extends State<P1modeController> {
  final TextEditingController _nickController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Constants.darkControllerColor,
        body:SingleChildScrollView(
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
                    // 1️⃣ 左侧蓝牙按钮
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft, // 想靠左就 left
                        padding: const EdgeInsets.only(left: 19), // 代替原来的 margin
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Image.asset('images/mode/back_icon.png',
                                  width: 8, height: 15),
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

              SizedBox(height: 91,),
              Center(child: Constants.mediumWhiteTextWidget("Desired Number of Shots", 24,Colors.white),),

              SizedBox(height: 30,),
              Container(
                height:55 ,
                width: 124,
                color: Constants.actionSwitchBGColor,
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Color.fromRGBO(248, 98, 21, 1),
                  onChanged: (value){
                    setState(() {});
                  },
                  controller: _nickController,
                  style: TextStyle(color:  Color.fromRGBO(132, 132, 132, 1)), // 设置字体颜色
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none, // 移除边框
                    hintText: '10-50',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent), // 设置焦点时的边框颜色
                    ),
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(132, 132, 132, 1.0),
                        fontFamily: 'SanFranciscoDisplay',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // child:Constants.mediumWhiteTextWidget('${nickName}', 18, Colors.white),
              ),

              SizedBox(height: 110,),

              Container(
                // color: Colors.red,
                width: Constants.screenWidth(context),
                height: 500,
                child: Stack(
                  children: [
                    Image(image: AssetImage("images/mode/icerink_bg_icon.png"),
                      fit: BoxFit.fitWidth,
                      width: Constants.screenWidth(context),
                      height: 500,),

                    Container(
                        alignment: Alignment.center,
                        child: Image.asset("images/mode/robot_high_icon.png",width: 207,height: 150,)
                    ),

                   Positioned(
                       bottom: 64,
                       left: (Constants.screenWidth(context) - 209) /2,
                       child:

                       GestureDetector(onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => P1modeGamingController()), //
                         );
                       },
                           child:Container(
                           width: 209,
                           height: 40,
                           decoration: BoxDecoration(
                             color: Constants.selectedModelBgColor,
                             borderRadius: BorderRadius.circular(8),
                           ),
                           alignment: Alignment.center,
                           // color: Constants.selectedModelBgColor,
                           child: Constants.regularWhiteTextWidget("Start On Hit", 16, Colors.white),
                         )
                       )
                   )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
