import 'package:flutter/material.dart';
import 'package:icehockeyrobot/home/month_data_summary_view.dart';
import 'package:icehockeyrobot/home/total_data_summary_view.dart';
import 'package:icehockeyrobot/p1mode/p1mode_controller.dart';
import 'package:icehockeyrobot/view/p1mode_view.dart';

import '../constants.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left:26,right: 26 ),
                        child:Constants.boldBaseTextWidget("ROBOT", 26),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(left: 140), // 代替原来的 margin
                          child: GestureDetector(
                            onTap: () {
                              print("蓝牙点击");
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    // color: Constants.bluetoothBGNewColor,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: Image.asset('images/home/battery_icon.png',
                                        width: 32, height: 32),
                                  ),
                                ),
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    // color: Constants.bluetoothBGNewColor,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: Image.asset('images/home/bluetooth_icon.png',
                                        width: 32, height: 32),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 46,),

                // 机器人
                Container(
                  padding: EdgeInsets.only(left:80,right: 80 ),
                  child: Image(image: AssetImage("images/home/home_robot.png"),width: 207,height: 150,),
                ),
                SizedBox(height: 38,),


                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 119,
                      decoration: BoxDecoration(
                        color: Constants.actionSwitchBGColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 100,
                      child: TotalDataSummaryView(),
                    ),

                    SizedBox(width: 8,),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Constants.actionSwitchBGColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: Constants.screenWidth(context) - 119 - 16 - 8 - 16,
                        height: 100,
                        child: MonthDataSummaryView(),
                      ),
                    ),
                  ],
                ),
                /// 当前月份的训练时间汇总
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: Constants.screenWidth(context),
                  child: Constants.boldWhiteTextWidget("Ttaining", 16,textAlign: TextAlign.left),
                ),


                SizedBox(height: 16,),
                Container(
                  width: Constants.screenWidth(context),
                  // height: Constants.screenHeight(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => P1modeController()), //
                        );
                      },
                        child:Container(
                          margin: EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            color: Constants.actionSwitchBGColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: (Constants.screenWidth(context) - 16 - 16 -9)/2,
                          height: 176,
                          child: P1modeView(type: "P1 Mode",),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 9,right: 16),
                        decoration: BoxDecoration(
                          color: Constants.actionSwitchBGColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: (Constants.screenWidth(context) - 16 - 16 -9)/2,
                        height: 176,
                        child: P1modeView(type: "Custom",),
                      )
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
