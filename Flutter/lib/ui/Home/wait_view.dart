import 'package:Greeneva/ui/Home/home_screen.dart';
import 'package:Greeneva/ui/Home/home_screen_view_model.dart';
// import 'package:Greeneva/ui/Home/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class Wait extends StatelessWidget {
  const Wait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spinkit = SpinKitRotatingCircle(
      color: Colors.green,
      size: 50.0,
    );
    return ViewModelBuilder<ExploreItemView>.reactive(
      viewModelBuilder: () => ExploreItemView(),
      onModelReady: (model) => model.getGoals(),
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            model.goals == null ? spinkit : HomeScreen(vid: model.goals),
          ],
        ),
      )),
    );
  }
}
