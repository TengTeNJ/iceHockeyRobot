import 'package:flutter/material.dart';

import '../../constants.dart';

/// 首页模式介绍的卡片
class HomeModeCardView extends StatefulWidget {
  const HomeModeCardView({super.key});

  @override
  State<HomeModeCardView> createState() => _HomeModeCardViewState();
}

class _HomeModeCardViewState extends State<HomeModeCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
        // 背景图片放在底部
        Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Image.asset(
          'images/new_home/bg_icon.png',  // 你的背景图
          // fit: BoxFit.cover,
          // width: 273,
          // height: 242,
        ),
      ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,  // 关键：只占用必要空间
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 16, left: 18),
                            child: Image(
                              image: AssetImage('images/new_home/time_icon.png'),
                              width: 17,
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 4),  // 4像素间距
                          Container(
                            margin: EdgeInsets.only(top: 16),  // 文字顶部对齐
                            child: Constants.regularWhiteTextWidget("180s", 12, Colors.white),
                          ),
                        ],
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 18,right: 19),
                          child:Image(image: AssetImage('images/new_home/mode_icon.png',),width:67,height: 77,)
                      ),
                    ],
                  )
              ),

              Container(
                margin: EdgeInsets.only(left: 18),
                child:Constants.boldWhiteTextWidget("Mode 1", 20),
              ),

              SizedBox(height: 6,),

              Container(
                margin:EdgeInsets.only(left: 18),
                child: Constants.regularWhiteTextWidget("Head to a 3-minute solo training session. Be\n sure to watch for the"
                    " robot's flashing lights \nand complete precise passing drills.", 12, Colors.white,textAlign: TextAlign.left),
              ),


              GestureDetector(onTap: (){

              },
                child:Container(
                    margin: EdgeInsets.only(left: 18,top: 21),
                    width: 110,
                    height: 37,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Constants.actionSwitchBGHighColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Constants.mediumWhiteTextWidget("Play Now", 14, Colors.white),
                        SizedBox(width: 11,),
                        Image.asset("images/new_home/right_icon.png",width: 18,height: 18,)
                      ],
                    )
                ),
              ),
            ],
          ),

    ]
      ),



    );
  }
}
