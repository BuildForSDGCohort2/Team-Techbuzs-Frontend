import 'package:Greeneva/Services/Api/api_sdg.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/explore_model.dart';
import 'package:flutter/material.dart';

class ExploreItemView extends ChangeNotifier {
  final _api = locator<Api>();

  List<ExploreItem> _goals;
  List<ExploreItem> get goals => _goals;

  Future getGoals() async {
    var goalResults = await _api.getGoals();

    if (goalResults is String) {
      // show error
      print("Error");
    } else {
      print(goalResults);
      print("Good");

      _goals = goalResults;
    }

    notifyListeners();
  }
}
