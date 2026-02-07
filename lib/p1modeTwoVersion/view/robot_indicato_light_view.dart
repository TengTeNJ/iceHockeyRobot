import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';

/// 机器人指示灯
class RobotIndicatoLightView extends StatefulWidget {
  int progress = 1;/// (Lv1 Lv2 Lv2)
  RobotIndicatoLightView({required this.progress});

  @override
  State<RobotIndicatoLightView> createState() => _RobotIndicatoLightViewState();
}

class _RobotIndicatoLightViewState extends State<RobotIndicatoLightView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset("images/new_mode/robot_high_light.png",width: 36,height: 32,),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color.fromRGBO(72, 216, 92, 1),
                ),
                width: 6,
                height: 6,
              )
            ],
          ),

          SizedBox(width: 19,),
          Column(
            children: [
              Image.asset("images/new_mode/robot_low_light.png",width: 36,height: 32),
              SizedBox(height: 15,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: widget.progress == 1 ?Colors.transparent : Color.fromRGBO(72, 216, 92, 1),
                ),
                width: 6,
                height: 6,
              )
            ],
          ),

          SizedBox(width: 19,),
          Column(
            children: [
              Image.asset("images/new_mode/robot_low_light.png",width: 36,height: 32),
              SizedBox(height: 15,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color:widget.progress == 1 ?Colors.transparent : Color.fromRGBO(72, 216, 92, 1),
                ),
                width: 6,
                height: 6,
              )
            ],
          ),
        ],
      ),
    );
  }
}
