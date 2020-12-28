import 'package:Greeneva/ui/Home/home_screen.dart';
import 'package:Greeneva/ui/Home/home_screen_view_model.dart';
import 'package:Greeneva/ui/Home/item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Wait extends StatelessWidget {
  const Wait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreItemView>.reactive(
      viewModelBuilder: () => ExploreItemView(),
      onModelReady: (model) => model.getGoals(),
      builder: (context, model, child) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 50,
          ),
          model.goals == null
              ? CircularProgressIndicator()
              : HomeScreen(vid: model.goals),
        ],
      )),
    );
  }
}
