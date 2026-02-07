import 'package:flutter/material.dart';
import 'package:icehockeyrobot/constants.dart';
import '../../p1mode/action_data_list_view.dart';

/// 首页数据汇总卡片
class HomeDataSummaryCardView extends StatefulWidget {
  const HomeDataSummaryCardView({super.key});

  @override
  State<HomeDataSummaryCardView> createState() => _HomeDataSummaryCardViewState();
}

class _HomeDataSummaryCardViewState extends State<HomeDataSummaryCardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child:Constants.regularWhiteTextWidget("Great work! Your daily average"
                " over the past week is 300 shots", 15, Color.fromRGBO(248, 114, 6, 1),
                textAlign: TextAlign.left),
          ),
          SizedBox(height: 20),
          ActionDataListView(todayCount: "12", useMinutes: 245, todayCal: 32),

        ]


    );
  }
}
