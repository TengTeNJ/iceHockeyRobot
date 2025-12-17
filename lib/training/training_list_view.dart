import 'package:flutter/material.dart';
import 'package:icehockeyrobot/model/training_data_model.dart';
import 'package:icehockeyrobot/training/training_item_view.dart';

class TrainingListView extends StatefulWidget {
  List<TrainingDataModel> datas;

  TrainingListView({required this.datas});

  @override
  State<TrainingListView> createState() => _TrainingListViewState();
}

class _TrainingListViewState extends State<TrainingListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 14),   // 去掉系统默认顶部 padding

        itemBuilder: (context, index) {
          return TrainingItemView(model: widget.datas[index]);
        }, separatorBuilder: (context, index) =>
        SizedBox(
          height: 10,
        ), itemCount: widget.datas.length);
  }
}
