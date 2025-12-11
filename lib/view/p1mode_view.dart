import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';

class P1modeView extends StatefulWidget {
  String type = "P1 Mode";
  P1modeView({this.type = "P1 Mode"});

  @override
  State<P1modeView> createState() => _P1modeViewState();
}

class _P1modeViewState extends State<P1modeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Constants.actionSwitchBGColor,
      child: Column(
        children: [
           Container(
               child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   padding: EdgeInsets.only(top: 16,left: 16),
                   child:Constants.boldBaseTextWidget("${widget.type}", 20,textColor: Color.fromRGBO(225, 70, 12, 1)),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 16,right: 16),
                   child:Image(image: AssetImage('images/home/right_arrow_icon.png',),width: 8*2,height: 15*2,)
                 )
               ],
             )
           ),

          widget.type == "P1 Mode" ?
          SizedBox(height: 34,) : SizedBox(height: 39,),


          widget.type == "P1 Mode" ?
          Container(
            child: Image.asset('images/home/p1mode_icon.png',
                width: 106, height: 73),
          ) :
          Container(
            child: Image.asset('images/home/custom_icon.png',
                width: 135, height: 75),
          )
        ],
      ),
    );
  }
}
