import 'dart:async';
import 'package:flutter/material.dart';
import 'package:icehockeyrobot/p1mode/action_data_list_view.dart';
import 'package:icehockeyrobot/p1mode/p1mode_countdown_view.dart';
import 'package:icehockeyrobot/p1mode/stats_line_area_view.dart';
import '../constants.dart';
import 'TrainingTImeModel.dart';

class P1modeGamingController extends StatefulWidget {
  const P1modeGamingController({super.key});

  @override
  State<P1modeGamingController> createState() => _P1modeGamingControllerState();
}

class _P1modeGamingControllerState extends State<P1modeGamingController> {
  int count = 3;
  bool isShowGo = false;
  bool countDownIsEnd = false;
  Timer ? countDownTimer;

  List<Trainingtimemodel> datas = [
    Trainingtimemodel(pickupBallTime: "18", time: "2025-06-23"),
    Trainingtimemodel(pickupBallTime: "18", time: "2025-07-23"),
    Trainingtimemodel(pickupBallTime: "6", time: "2025-08-23"),
    Trainingtimemodel(pickupBallTime: "8", time: "2025-09-17"),
    Trainingtimemodel(pickupBallTime: "3", time: "2025-09-23"),
    Trainingtimemodel(pickupBallTime: "8", time: "2025-10-26"),
    Trainingtimemodel(pickupBallTime: "10", time: "2025-11-28"),
    Trainingtimemodel(pickupBallTime: "12", time: "2025-12-30"),
  ]; //

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

              SizedBox(height: 58,),
              Center(child: Stack(
                children: [
                  Center(child: Image(image: AssetImage("images/mode/circle_bg.png"),width: 233,
                    height: 233,)),
               
                 Positioned(
                     top: 0,
                     left: (Constants.screenWidth(context) - 233) / 2,
                     child: Container(
                         alignment:Alignment.center,
                       // color: Colors.red,
                       width: 233,
                       height: 233,
                       child:Center(
                         child:
                         countDownIsEnd ?
                         Container(
                           width: 233,
                           height: 233,
                           child:P1modeCountdownView()
                         ) :
                         Text(
                           isShowGo ? "GO!" : '${count}',
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 88,
                               fontFamily: "SanFranciscoDisplay",
                               height: 1.0,              // 2. 去掉行高
                               leadingDistribution: TextLeadingDistribution.even,
                               color: Colors.white),
                         ),
                       )
                     )
                 ),
               
                ],
              )),

              SizedBox(height: 44,),

              ActionDataListView(todayCount: "12", useMinutes: 245, todayCal: 32),

              Container(
                margin: EdgeInsets.only(left: 16,top: 60,right: 16),
                width: Constants.screenWidth(context),
                child: Constants.mediumWhiteTextWidget("Time on Trainings", 16, Colors.white,
                    textAlign: TextAlign.left),
              ),

              Container(
                margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                height: 240,
                child: StatsLineAreaView(datas: datas),
              ),
              SizedBox(height: 64,)
            ]
          ),
        ),
      ),
    );
  }

}
