import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/ui/widgets/target_home/target_home_item.dart';
import 'package:flutter/material.dart';
import 'package:Greeneva/extensions/hover_extension.dart';

class TargetHList extends StatelessWidget {
  final List<GoalAPI> goals;
  TargetHList({this.goals});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: <Widget>[
        ...goals.map(
          (goal) => TargetHItem(model: goal).showCursorOnHover.moveUpOnHover,
        )
      ],
    );
  }
}
