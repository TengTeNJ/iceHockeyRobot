import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';

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
        Constants.regularWhiteTextWidget("Score", 18, Colors.white),

        SizedBox(height: 16,),
        Constants.dsdigiTextWidget("39", 124),


        SizedBox(height: 24,),
        Image(image: AssetImage("images/new_mode/stop_game_icon.png"),width: 24,height: 24,),

        SizedBox(height: 8,),

      ],
    );
  }
}
