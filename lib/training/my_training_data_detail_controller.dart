import 'package:flutter/material.dart';
import 'package:icehockeyrobot/training/training_data_view.dart';

import '../constants.dart';
import 'month_data_model.dart';

class MyTrainingDataDetailController extends StatefulWidget {
  const MyTrainingDataDetailController({super.key});

  @override
  State<MyTrainingDataDetailController> createState() => _MyTrainingDataDetailControllerState();
}

class _MyTrainingDataDetailControllerState extends State<MyTrainingDataDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.darkControllerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 64),
            Constants.boldBaseTextWidget("Training", 22),
            SizedBox(height: 35),

            SizedBox(height: 36),
            Container(
              margin: EdgeInsets.only(left: 16),
              width: Constants.screenWidth(context),
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Constants.mediumWhiteTextWidget(
                    "Training History",
                    16,
                    Colors.white,
                  ),
                  SizedBox(height: 18),

                  /// Parks
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: TrainingDataView(
                      model: MonthDataModel("Parks", "36", "+2%",
                          isRise: true),
                    ),
                  ),

                  SizedBox(height: 26),
                  Container(
                    width: Constants.screenWidth(context) - 32,
                    height: 0.5,
                    color: Color.fromRGBO(86, 86, 116, 1.0),
                  ),

                  /// 平均训练时间
                  SizedBox(height: 26),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: TrainingDataView(
                      model: MonthDataModel("Reaction", "3.5s", "+2%"),
                    ),
                  ),

                  SizedBox(height: 26),
                  Container(
                    width: Constants.screenWidth(context) - 32,
                    height: 0.5,
                    color: Color.fromRGBO(86, 86, 116, 1.0),
                  ),

                  /// Rate
                  SizedBox(height: 26),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: TrainingDataView(
                      model: MonthDataModel(
                        "Rate",
                        "68%",
                        "+2%"
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
