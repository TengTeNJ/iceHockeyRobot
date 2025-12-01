import 'package:flutter/material.dart';

import 'action_list_view.dart';

class ActionDataListView extends StatefulWidget {
  String todayCount;
  int todayCal;
  int useMinutes;

  ActionDataListView({required this.todayCount, required this.useMinutes, required this.todayCal});

  @override
  State<ActionDataListView> createState() => _ActionDataListViewState();
}

class _ActionDataListViewState extends State<ActionDataListView> {
  String todayCount = '0'; //今天捡球数
  int todayCal = 0; // 今日消耗卡路里
  int useMinutes = 0;// 今日使用分钟数

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionListView(
                title: 'Parks',
                desc: "${widget.todayCount}"),
            ActionListView(
              title: 'Reaction',
              desc: '${widget.useMinutes}',
              unit: 's',
            ),
            // SizedBox(width: 20),
            ActionListView(
                title: 'Hit Rate',
                desc: '${widget.todayCal}'),
          ],
        ),
      ],
    );
  }
}
