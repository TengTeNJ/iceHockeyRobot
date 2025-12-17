import 'package:flutter/material.dart';
import 'package:icehockeyrobot/model/rank_data_model.dart';

import '../constants.dart';

class RankItemView extends StatefulWidget {
  RankDataModel model;

  RankItemView({required this.model});

  @override
  State<RankItemView> createState() => _RankItemViewState();
}

class _RankItemViewState extends State<RankItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: (){
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),),
          height: 48,
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // margin: EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 16,),
                        Constants.mediumWhiteTextWidget('${widget.model.index}', 16, Constants.circlrGreyColor),

                        SizedBox(width: 20,),

                        Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: Colors.red,          // 背景色，可留可不留
                            shape: BoxShape.circle,     // 让 Container 本身变成圆
                          ),
                          child: ClipOval(               // 把图片裁成圆
                            child: Image.asset(
                              'images/home/home_robot.png',
                              width: 38,
                              height: 38,
                              fit: BoxFit.cover,        // 保证图片填满圆
                            ),
                          ),
                        ),

                        SizedBox(width: 17,),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Constants.mediumWhiteTextWidget('${widget.model.nickName}', 16, Colors.white),
                            SizedBox(height: 4,),
                            Constants.regularWhiteTextWidget("${widget.model.region}", 14, Color.fromRGBO(180, 180, 180, 1.0)),
                          ],
                        ),

                        SizedBox(width: 120,),
                        Constants.mediumWhiteTextWidget('${widget.model.reactionTime}', 20, Colors.white),

                      ],
                    ),
                  ),
                ],

              ),


              SizedBox(height: 9,),
              Container(
                height: 1,
                width: Constants.screenWidth(context)  - 32*2,
                color: Color.fromRGBO(86, 86, 116, 1.0),
              )

            ],
          )



      ),
    );
  }
}
