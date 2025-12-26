import 'package:flutter/material.dart';
import 'package:icehockeyrobot/training/my_training_data_detail_controller.dart';
import 'package:icehockeyrobot/training/training_list_view.dart';

import '../constants.dart';
import '../model/training_data_model.dart';
import '../util/dialog.dart';
import 'package:icehockeyrobot/util/string_util.dart';


class MyTrainingDataController extends StatefulWidget {
  const MyTrainingDataController({super.key});

  @override
  State<MyTrainingDataController> createState() => _MyTrainingDataControllerState();
}

class _MyTrainingDataControllerState extends State<MyTrainingDataController> {
  List<TrainingDataModel> data = [
    TrainingDataModel("17", "3.5s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("66", "16s", "68%"),
    TrainingDataModel("17", "20", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("66", "20s", "68%"),TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("66", "6.5s", "68%"),TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "16s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("17", "20s", "68%"),
    TrainingDataModel("66", "16s", "68%",isShowBottomLine: false),
  ];

  List<String> titles = [
    'Last 7 days',
    'Last 30 days',
    'Last 90 days',
    'Custom'
  ];
  int _timeIndex = 0;
  String _startTime = '';
  String _endTime = '';

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
              SizedBox(height: 27,),

              GestureDetector(onTap: (){
                TTDialog.timeSelect(context, (startTime, endTime ,index){
                  print('${startTime}--${endTime}--${index}');
                  _timeIndex = index;
                  _startTime = startTime;
                  _endTime = endTime;
                  // filterData(startTime, endTime);
                  if (index == 3) {
                    titles[titles.length-1] = "${StringUtil.serviceStringMyStatuDateString(_startTime)}-${StringUtil.serviceStringMyStatuDateString(_endTime)}";
                  }
                  setState(() {});
                },index: _timeIndex,start: _startTime != '' ? _startTime :null,end: _endTime != '' ? _endTime : null);

              },
               child:Container(
                 margin: EdgeInsets.only(left: 20,right: 250),
                 width: 120,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   color: Constants.darkThemeColor,
                   border: Border.all(
                       color: Color.fromRGBO(112, 112, 112, 1.0), width: 1),
                 ),
                 padding: EdgeInsets.only(
                     top: 4, bottom: 4, left: 16, right: 16),
                 child: Row(
                   children: [
                     Constants.regularWhiteTextWidget(
                         '${titles[0]}', 14,Colors.white),
                     SizedBox(
                       width: 8,
                     ),
                     Image(
                       image: AssetImage('images/train/stats_down.png'),
                       width: 8,
                       height: 5,
                     )
                   ],
                 ),
               ),),

              SizedBox(height: 12,),


              Container(
                // color: Colors.red,
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

             SizedBox(height: 14,),
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
                child: TrainingListView(datas: data,ishomePage: false,),
              ),),

              SizedBox(height: 44,)

            ],
          ),
        ),
      ),
    );

  }
}
