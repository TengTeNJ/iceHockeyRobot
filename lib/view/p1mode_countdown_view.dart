import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';
import 'package:icehockeyrobot/p1mode/p1mode_settlement_controller.dart';
import 'package:vibration/vibration.dart';

class P1modeCountdownView extends StatefulWidget {
  const P1modeCountdownView({super.key});

  @override
  State<P1modeCountdownView> createState() => _P1modeCountdownViewState();
}

class _P1modeCountdownViewState extends State<P1modeCountdownView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Image(image: AssetImage("images/mode/hit_ice_icon.png"),width: 24,height: 21,),
         SizedBox(height: 8,),
        Constants.mediumWhiteTextWidget("02:40:30", 40, Colors.white),
        SizedBox(height: 16,),

        GestureDetector(onTap: (){
          print("暂停or开始");
          Vibration.vibrate(duration: 500);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => P1modeSettlementController()), //
          );
          },
         child:Image(image: AssetImage("images/mode/stop_icon.png"),width: 65,height: 65,),
        )
      ],
    );
  }
}
