import 'package:flutter/material.dart';

import '../../constants.dart';

/// 模式介绍的自定义view
class Patternintroductionview extends StatefulWidget {
  String title;
  String introduction;

  Patternintroductionview({required this.title, required this.introduction});

  @override
  State<Patternintroductionview> createState() => _PatternintroductionviewState();
}

class _PatternintroductionviewState extends State<Patternintroductionview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Color.fromRGBO(251, 92, 33, 1),Color.fromRGBO(248, 187, 21, 1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // 比外层小一点
          color: Color.fromRGBO(22, 22, 22, 1), // 内部背景色
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                    Container(
                        margin: EdgeInsets.only(left: 22),
                        child:Image(image: AssetImage('images/new_mode/robot_icon.png',),width:58,height: 52,)
                    ),
            SizedBox(height: 24,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child:Constants.boldWhiteTextWidget("${widget.title}", 22,textColor: Color.fromRGBO(241, 95, 8, 1),textAlign: TextAlign.left),
                ),

                SizedBox(height: 6,),
                Container(
                  margin:EdgeInsets.only(left: 20),
                  child: Constants.regularWhiteTextWidget("${widget.introduction}", 16, Constants.connectTextColor,
                      textAlign: TextAlign.left),
                ),
              ],
            ),

          ],
        ),
      ),

    );
  }
}
