import 'package:flutter/material.dart';
import 'package:icehockeyrobot/home/month_data_summary_view.dart';
import 'package:icehockeyrobot/home/total_data_summary_view.dart';
import 'package:icehockeyrobot/home/view/home_data_summary_card_view.dart';
import 'package:icehockeyrobot/home/view/home_mode_card_view.dart';
import 'package:icehockeyrobot/home/view/home_subscribe_card_view.dart';
import 'package:icehockeyrobot/p1mode/p1_background_controller.dart';
import 'package:icehockeyrobot/p1mode/p1mode_gaming_controller.dart';
import 'package:icehockeyrobot/p1modeTwoVersion/mode%20_startup_%20page.dart';
import 'package:icehockeyrobot/util/blue_tooth_manager.dart';
import 'package:icehockeyrobot/view/p1mode_view.dart';
import '../constants.dart';
import '../p1mode/p1mode_controller.dart';
import '../util/ble_util.dart';
import '../util/dialog.dart';

enum BatteryMode {
  batteryIconMode, // 图标模式
  batteryNumberMode, // 数字模式
}

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  BatteryMode batteryMode = BatteryMode.batteryIconMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BluetoothManager();
    Future.delayed(Duration(milliseconds: 600), () {
      // bool result = BleUtil.handleBleStatu(context);
      // if (result) {
      BleUtil.begainScan(context);
      // }
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
                    // width: Constants.screenWidth(context),
                    // height: 164,
                    child: Stack(
                      children: [
                        // 背景图片放在底部
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            // color: Colors.red,
                            child: Image.asset(
                              'images/new_home/circle_bg.png',width: Constants.screenWidth(context),
                              height: 164,
                              fit: BoxFit.fitWidth,  // 拉伸填满（可能变形）
                              // 你的背景图
                            ),
                          )
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 24,top: 56),
                                  child: Image.asset("images/new_home/avatar_icon.png",width: 32,
                                    height: 32,
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(right: 24,top: 56),
                                  child: Image.asset("images/new_home/battery_icon.png",width: 24,
                                    height: 12,
                                  ),
                                ),
                              ],
                            ),

                            Container(
                                margin: EdgeInsets.only(left: 30,top: 24),
                                width: Constants.screenWidth(context) - 120,
                                child:Image.asset("images/new_home/robot_icon.png",
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                    ),




                SizedBox(height: 46,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,  // 横向滚动
                  child: Row(
                    children: [
                      // 第一个卡片
                      GestureDetector(
                        onTap: () {
                          print("首页点击P1 模式的卡片");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ModeStartuppage()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 24, right: 12),  // 左边距24，右边留点间隙
                          width: 273,
                          height: 242,
                          child: HomeModeCardView(),
                        ),
                      ),

                      // 第二个卡片
                      GestureDetector(
                        onTap: () {
                          print("首页点击P2 模式的卡片");  // 修改提示
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => P1modeGamingController()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 24),  // 右边距24，与左边对称
                          width: 273,
                          height: 242,
                          child: HomeModeCardView(),  // 或另一个卡片组件
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 16,),
                GestureDetector(onTap: (){
                  print("首页点击订阅的卡片");
                },
                  child:Container(
                    margin: EdgeInsets.only(left: 24,right: 24),
                    height: 99,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(45, 45, 57, 1),
                    ),
                    child: HomeSubscribeCardView(),
                  ),),


                SizedBox(height: 16,),
                GestureDetector(onTap: (){
                  print("首页点击订阅的卡片");
                },
                  child:Container(
                    margin: EdgeInsets.only(left: 24,right: 24),
                    height: 141,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(45, 45, 57, 1),
                    ),
                    child: HomeDataSummaryCardView(),
                  ),),

                SizedBox(height: 37,)

              ],
            ),
        ),
      ),
    );
  }
}
