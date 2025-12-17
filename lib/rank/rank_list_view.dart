import 'package:flutter/material.dart';
import 'package:icehockeyrobot/model/rank_data_model.dart';
import 'package:icehockeyrobot/rank/rank_item_view.dart';

import '../training/training_item_view.dart';

class RankListView extends StatefulWidget {
  List<RankDataModel> datas;

  RankListView({required this.datas});

  @override
  State<RankListView> createState() => _RankListViewState();
}

class _RankListViewState extends State<RankListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 14),   // 去掉系统默认顶部 padding

        itemBuilder: (context, index) {
          return RankItemView(model: widget.datas[index]);
        }, separatorBuilder: (context, index) =>
        SizedBox(
          height: 10,
        ), itemCount: widget.datas.length);
  }
}
