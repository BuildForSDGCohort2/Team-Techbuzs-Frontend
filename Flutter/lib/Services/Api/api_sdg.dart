import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const String _apiEndpoint = 'https://sdgfortb.herokuapp.com/api';

  Future<dynamic> getGoals() async {
    var response = await http.get('$_apiEndpoint/goals');

    if (response.statusCode == 200) {
      var goals = (json.decode(response.body) as List)
          .map((episode) => GoalAPI.fromJson(episode))
          .toList();
      return goals;
    }

    // something wrong happened
    return 'Could not fetch the Goals at this time';
  }
}
