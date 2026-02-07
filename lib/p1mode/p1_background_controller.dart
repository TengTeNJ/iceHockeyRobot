import 'package:flutter/material.dart';
import 'package:icehockeyrobot/model/ble_model.dart';

import '../constants.dart';
import '../util/ble_send_util.dart';
import '../util/bluetooth_data_parse.dart';
import 'edge_follower.dart';

class P1BackgroundController extends StatefulWidget {
  const P1BackgroundController({super.key});

  @override
  State<P1BackgroundController> createState() => _P1BackgroundControllerState();
}

class _P1BackgroundControllerState extends State<P1BackgroundController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BleSendUtil.setRobotGameMode(RobotMode.gameModeP1);
    // List<int> data  = [165, 6, 18, 0, 189, 170];
    // BluetoothDataParse.parseData(data);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: Constants.screenWidth(context),
            height: Constants.screenHeight(context),
            child: Stack(
              children: [
                Image(image: AssetImage("images/mode/p1_bg.png"),
                  fit: BoxFit.cover,
                  width: Constants.screenWidth(context),
                  height: Constants.screenHeight(context),),
                Container(
                    alignment: Alignment.center,
                    child: EdgeFollower()
                ),
              ],
            )
        )
      ],
    );
  }
}
