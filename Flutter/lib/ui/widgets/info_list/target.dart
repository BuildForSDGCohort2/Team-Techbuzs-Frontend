import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/ui/widgets/info_list/target_item.dart';
import 'package:flutter/material.dart';

class Targets extends StatelessWidget {
  final GoalAPI model;

  Targets({this.model});

  @override
  Widget build(BuildContext context) {
    // String idm =
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
            ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    child: SizedBox(
                      width: 360,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180,
                            child: Image.asset(
                              model.image == null
                                  ? 'assets/SDGs/sdg1.png'
                                  : model.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${model.targets["1.1.$index"]["name"]}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                  softWrap: true,
                                ),
                                Text(
                                  '${model.targets["1.1.1"]["definition"]}',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            // Text(model.targets['1.1'].toString())
          ],
        ),
      ),
    );
  }
}
