import 'package:flutter/material.dart';

import '../../constants.dart';

/// 首页订阅的卡片
class HomeSubscribeCardView extends StatefulWidget {
  const HomeSubscribeCardView({super.key});

  @override
  State<HomeSubscribeCardView> createState() => _HomeSubscribeCardViewState();
}

class _HomeSubscribeCardViewState extends State<HomeSubscribeCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Constants.actionSwitchBGColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(left: 25),
              child:Image(image: AssetImage('images/new_home/subscribe_icon.png',),width:36,height: 38,)
          ),


         SizedBox(width: 18,),
          Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Constants.boldWhiteTextWidget("Subscribe to Plus", 16),
                  SizedBox(height: 4,),
                  Constants.regularWhiteTextWidget("Become a Member and take the next step \n "
                      "toward your goals.", 12, Colors.white,textAlign: TextAlign.left),
                ],
              )
          ),

        ],
      ),
    );
  }
}
