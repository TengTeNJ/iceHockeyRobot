import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/training_data_model.dart';

class TrainingItemView extends StatefulWidget {
  TrainingDataModel model;

  TrainingItemView({required this.model});

  @override
  State<TrainingItemView> createState() => _TrainingItemViewState();
}

class _TrainingItemViewState extends State<TrainingItemView> {
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
        height: 38,
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

                      SizedBox(width: 33,),
                      Constants.mediumWhiteTextWidget('${widget.model.parks}', 16, Color.fromRGBO(214, 49, 23, 1)),

                      SizedBox(width: 80,),
                      Constants.mediumWhiteTextWidget('${widget.model.reaction}', 16, Color.fromRGBO(91, 204, 144, 1)),

                      SizedBox(width: 82,),
                      Constants.mediumWhiteTextWidget('${widget.model.rate}', 16, Color.fromRGBO(230, 224, 27, 1)),


                    ],
                  ),
                ),
              ],

            ),


            SizedBox(height: 9,),
            widget.model.isShowBottomLine == false ?
              Container()
            : Container(
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
