import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


/// 总的数据汇总界面
class TotalDataSummaryView extends StatefulWidget {
  const TotalDataSummaryView({super.key});

  @override
  State<TotalDataSummaryView> createState() => _TotalDataSummaryViewState();
}

class _TotalDataSummaryViewState extends State<TotalDataSummaryView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               child:Constants.mediumWhiteTextWidget("782", 16, Color.fromRGBO(21, 233, 120, 1.0)),
             ),

             Constants.mediumWhiteTextWidget("Parks", 8, Constants.baseGreyStyleColor),

             SizedBox(height: 8,),

             Container(
               margin: EdgeInsets.only(left: 8),
               child: Constants.mediumWhiteTextWidget("00:48", 16, Color.fromRGBO(35, 141, 235, 1.0)),
             ),

             Constants.mediumWhiteTextWidget("Time", 8, Constants.baseGreyStyleColor),
           ],

        ),
        SizedBox(width: 12,),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            new CircularPercentIndicator(
              radius: 47.0/2,
              lineWidth: 4.0,
              percent: 0.8,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "80%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: 'SanFranciscoDisplay',
                        color: Color.fromRGBO(21, 233, 120, 1.0)),
                  ),
                ],
              ),
              backgroundColor: Color.fromRGBO(112, 112, 112, 1.0),
              progressColor: Color.fromRGBO(21, 233, 120, 1.0),
            ),

            SizedBox(height: 8,),

            Constants.mediumWhiteTextWidget("today", 8, Constants.baseGreyStyleColor),


          ],
        )

      ],
    );
  }
}
