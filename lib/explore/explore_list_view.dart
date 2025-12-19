import 'package:flutter/material.dart';

import '../model/setup_model.dart';
import 'explore_item_view.dart';


class ExploreListView extends StatefulWidget {
  List<SetupModel> datas;

  ExploreListView({required this.datas});

  @override
  State<ExploreListView> createState() => _ExploreListViewState();
}

class _ExploreListViewState extends State<ExploreListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,   // 去掉系统默认顶部 padding

        itemBuilder: (context,index){
          return ExploreItemView(model: widget.datas[index],);
        }, separatorBuilder: (context, index) =>SizedBox(
      height: 10,
    ), itemCount: widget.datas.length);
  }
}
