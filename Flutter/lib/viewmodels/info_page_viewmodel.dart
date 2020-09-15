import 'package:Greeneva/Services/Api/api_sdg.dart';
import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/locator.dart';
import 'package:flutter/material.dart';

class InfoViewModel extends ChangeNotifier {
  final _api = locator<Api>();

  List<GoalAPI> _goals;
  List<GoalAPI> get goals => _goals;

  Future getGoals() async {
    var goalResults = await _api.getGoals();

    if (goalResults is String) {
      // show error
    } else {
      _goals = goalResults;
    }

    notifyListeners();
  }
}
