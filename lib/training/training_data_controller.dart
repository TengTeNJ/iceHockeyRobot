import 'package:flutter/material.dart';
import 'package:icehockeyrobot/home/month_data_summary_view.dart';
import 'package:icehockeyrobot/model/rank_data_model.dart';
import 'package:icehockeyrobot/model/training_data_model.dart';
import 'package:icehockeyrobot/rank/rank_list_view.dart';
import 'package:icehockeyrobot/training/my_training_data_controller.dart';
import 'package:icehockeyrobot/training/training_list_view.dart';

import '../constants.dart';
import '../home/total_data_summary_view.dart';


class TrainingDataController extends StatefulWidget {
  const TrainingDataController({super.key});

  @override
  State<TrainingDataController> createState() => _TrainingDataControllerState();
}

class _TrainingDataControllerState extends State<TrainingDataController> {
  List<TrainingDataModel> data = [
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("66", "20", "68%",isShowBottomLine: false),
  ];

  List<RankDataModel> rankData = [
    RankDataModel("Alen", "London", "3.5s",index: 1),
    RankDataModel("Jacky", "English", "4.5s",index: 2),
    RankDataModel("Jacky", "China", "3.8s",index: 3),
    RankDataModel("Tommy", "Japan", "6.7s",index: 4),
    RankDataModel("Jue", "Australis", "2.9s",index: 5),
  ];



  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Constants.darkControllerColor,
        body:SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(height: 60,),

              Center(
                child: Constants.boldWhiteTextWidget("Training", 22),
              ),

              SizedBox(height: 35,),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                // width: Constants.screenWidth(context) - 32,
                decoration: BoxDecoration(
                  color: Constants.actionSwitchBGColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 100,
                child: MonthDataSummaryView(),
              ),
              SizedBox(height: 24,),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: Constants.screenWidth(context) - 32,
                child:Constants.mediumWhiteTextWidget("Training History", 18, Colors.white,textAlign: TextAlign.left),
              ),



              SizedBox(height: 15,),


              Container(
                decoration: BoxDecoration(
                  color: Constants.darkDialogColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                ),
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
                      builder: (context) => MyTrainingDataController()), //
                );
              },
                child:Container(
                  decoration: BoxDecoration(
                    color: Constants.darkDialogColor,
                    // 只保留左下 + 右下圆角
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  width: Constants.screenWidth(context) - 32,
                  height: 250,
                  child: TrainingListView(datas: data),
                ),
              ),


              SizedBox(height: 24,),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: Constants.screenWidth(context) - 32,
                child:Constants.mediumWhiteTextWidget("Rank", 18, Colors.white,textAlign: TextAlign.left),
              ),


              SizedBox(height: 15,),
              GestureDetector(onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyTrainingDataController()), //
                );
              },
                child:Container(
                  decoration: BoxDecoration(
                    color: Constants.darkDialogColor,
                    borderRadius:BorderRadius.circular(10),
                  ),
                  width: Constants.screenWidth(context) - 32,
                  height: rankData.length * (48 + 10) + 14,
                  child: RankListView(datas: rankData),
                ),
              ),
              SizedBox(height: 18,),

            ],
          ),
        ),
      ),
    );
  }
}
