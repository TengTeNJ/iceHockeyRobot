import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../p1mode/action_data_list_view.dart';
import '../../p1mode/action_list_view.dart';

class Trainingsatesview extends StatefulWidget {
  const Trainingsatesview({super.key});

  @override
  State<Trainingsatesview> createState() => _TrainingsatesviewState();
}

class _TrainingsatesviewState extends State<Trainingsatesview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionListView(
                title: 'Shots IN',
                desc: "10"),
            ActionListView(
              title: 'Streak 5 Shots',
              desc: '3',
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionListView(
                title: 'Reaction.avge',
                desc: "2.5s"),
            ActionListView(
              title: 'Hit Rate',
              desc: '85%',
            ),
          ],
        ),
      ],
    );

  }
}
