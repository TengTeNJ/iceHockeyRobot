import 'package:flutter/material.dart';
import 'package:icehockeyrobot/training/training_data_view.dart';

import '../constants.dart';
import '../model/TrainingTImeModel.dart';
import '../p1mode/stats_line_area_view.dart';
import 'month_data_model.dart';

class MyTrainingDataDetailController extends StatefulWidget {
  const MyTrainingDataDetailController({super.key});

  @override
  State<MyTrainingDataDetailController> createState() => _MyTrainingDataDetailControllerState();
}

class _MyTrainingDataDetailControllerState extends State<MyTrainingDataDetailController> {
  List<Trainingtimemodel> datas = [
    Trainingtimemodel(pickupBallTime: "18", time: "2025-06-23"),
    Trainingtimemodel(pickupBallTime: "18", time: "2025-07-23"),
    Trainingtimemodel(pickupBallTime: "6", time: "2025-08-23"),
    Trainingtimemodel(pickupBallTime: "8", time: "2025-09-17"),
    Trainingtimemodel(pickupBallTime: "3", time: "2025-09-23"),
    Trainingtimemodel(pickupBallTime: "8", time: "2025-10-26"),
    Trainingtimemodel(pickupBallTime: "10", time: "2025-11-28"),
    Trainingtimemodel(pickupBallTime: "12", time: "2025-11-29"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child:Container(
          color: Constants.darkControllerColor,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 64),
              Constants.boldBaseTextWidget("Training", 22),
              SizedBox(height: 35),
              Container(
                margin: EdgeInsets.only(left: 16),
                width: Constants.screenWidth(context),
                height: Constants.screenHeight(context),

                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    Container(
                      margin: EdgeInsets.only(left: 16,top: 54,right: 16),
                      width: Constants.screenWidth(context),
                      child: Constants.mediumWhiteTextWidget("Time on Trainings", 16, Colors.white,
                          textAlign: TextAlign.left),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 16,right: 16),
                      height: 240,
                      child: StatsLineAreaView(datas: datas),
                    ),
                    SizedBox(height: 24,)
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );

  }
}
