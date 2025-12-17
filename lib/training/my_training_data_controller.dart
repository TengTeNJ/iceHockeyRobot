import 'package:flutter/material.dart';
import 'package:icehockeyrobot/training/my_training_data_detail_controller.dart';
import 'package:icehockeyrobot/training/training_list_view.dart';

import '../constants.dart';
import '../model/training_data_model.dart';

class MyTrainingDataController extends StatefulWidget {
  const MyTrainingDataController({super.key});

  @override
  State<MyTrainingDataController> createState() => _MyTrainingDataControllerState();
}

class _MyTrainingDataControllerState extends State<MyTrainingDataController> {
  List<TrainingDataModel> data = [
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("66", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("66", "20", "68%"),TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("66", "20", "68%"),TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("66", "20", "68%",isShowBottomLine: false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Constants.darkControllerColor,
        body:SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(height: 60,),

              Center(
                child: Constants.boldWhiteTextWidget("My Training", 22),
              ),

              SizedBox(height: 35,),


              Container(
                width: Constants.screenWidth(context) - 32,
                // height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24), // 顶部间距，想调多少改数字
                  child: Row(
                    children: [
                      const SizedBox(width: 55),
                      Constants.regularWhiteTextWidget("Parks", 16,
                          const Color.fromRGBO(177, 177, 177, 1)),
                      const SizedBox(width: 60),
                      Constants.regularWhiteTextWidget("Reaction", 16,
                          const Color.fromRGBO(177, 177, 177, 1)),
                      const SizedBox(width: 40),
                      Constants.regularWhiteTextWidget("Rate", 16,
                          const Color.fromRGBO(177, 177, 177, 1)),
                    ],
                  ),
                ),
              ),


             GestureDetector(onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => MyTrainingDataDetailController()), //
               );
             },
              child: Container(
                width: Constants.screenWidth(context) - 32,
                height: Constants.screenHeight(context)-140,
                // color: Colors.red,
                child: TrainingListView(datas: data),
              ),)


            ],
          ),
        ),
      ),
    );

  }
}
