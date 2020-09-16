import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';
import 'package:flutter/material.dart';

class TargetHItem extends StatelessWidget {
  final NavigationServiceM _navigationServiceM = locator<NavigationServiceM>();
  final GoalAPI model;
  TargetHItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int goal = model.goal;
    String target = goal.toString() + '.';

    return GestureDetector(
        onTap: () =>
            _navigationServiceM.navigateTo(TargetsView, arguments: model),
        child: Column(
          children: List.generate(2, (index) {
            String ap = target + ((index + 1).toString() + '.' + '1');
            return Card(
              color: Colors.white,
              elevation: 2,
              child: SizedBox(
                width: 500,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
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
                            model.short,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            softWrap: true,
                          ),
                          model.target[ap]["name"] is String
                              ? Text(
                                  '${model.target[ap]["name"]} ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                  softWrap: true,
                                )
                              : Text(''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
