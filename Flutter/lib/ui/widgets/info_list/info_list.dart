import 'dart:html';

import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/ui/widgets/info_list/info_item.dart';
import 'package:flutter/material.dart';
import 'package:Greeneva/extensions/hover_extension.dart';

class InfoList extends StatelessWidget {
  final List<GoalAPI> goals;
  InfoList({this.goals});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: <Widget>[
        ...goals.map(
          (goal) => InfoItem(model: goal).showCursorOnHover.moveUpOnHover,
        )
      ],
    );
  }
}
