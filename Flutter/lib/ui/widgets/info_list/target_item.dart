import 'package:Greeneva/Services/Api/goals_model.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';
import 'package:flutter/material.dart';

class TargetItem extends StatelessWidget {
  final NavigationServiceM _navigationService = locator<NavigationServiceM>();
  final GoalAPI model;

  TargetItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = model.goal;
    return GestureDetector(
      onTap: () => _navigationService.navigateTo(TargetsView, arguments: model),
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: SizedBox(
          width: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 180,
                child: Image.asset(
                  model.image == null ? 'assets/SDGs/sdg1.png' : model.image,
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
                      '${model.target["1.1.1"]["definition"]}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      '${model.target["1.1.1"]["name"]}',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
