import 'package:Greeneva/ui/Donation/Plant/onetreeplanted/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

Future<List<TreeInfo>> fetchGoals(http.Client client) async {
  final response =
      await client.get('https://sdgfortb.herokuapp.com/api/onetreeplanted');

  // Use the compute function to run parseGoalss in a separate isolate.
  // print(response.body);
  // print(parseGoalss);
  // print(response.statusCode);
  return compute(parseGoalss, response.body);
}

// A function that converts a response body into a List<TreeInfo>.
List<TreeInfo> parseGoalss(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//  print(parsed);
  return parsed.map<TreeInfo>((json) => TreeInfo.fromJson(json)).toList();
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TreeInfo>>(
      future: fetchGoals(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? OPlant(info: snapshot.data)
            : Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.greenAccent,
              ));
      },
    );
  }
}

class OPlant extends StatelessWidget {
  final List<TreeInfo> info;

  OPlant({this.info});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
