import 'package:flutter/material.dart';

import '../constants.dart';
import 'month_data_model.dart';

class TrainingDataView extends StatefulWidget {
  MonthDataModel model;

  TrainingDataView({required this.model});

  @override
  State<TrainingDataView> createState() => _TrainingDataViewState();
}

class _TrainingDataViewState extends State<TrainingDataView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Constants.mediumWhiteTextWidget("${widget.model.Parks}", 16, Constants.baseGreyStyleColor),
        SizedBox(height: 8,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Constants.mediumWhiteTextWidget("${widget.model.Reaction}", 40, Colors.white),
            SizedBox(width: 9,),


            Constants.mediumWhiteTextWidget("${widget.model.Rate}", 14,
                widget.model.isRise == true ?
                Color.fromRGBO(91, 204, 106, 1.0) :
                Color.fromRGBO(227, 62, 62, 1.0)),



            SizedBox(width: 5,),
            widget.model.isRise == true ?
            Image.asset("images/home/rise_icon.png",width: 6.23,height: 7.5,) :
            Image.asset("images/home/drop_icon.png",width: 6.23,height: 7.5,)
          ],
        )
      ],
    );
  }
}
