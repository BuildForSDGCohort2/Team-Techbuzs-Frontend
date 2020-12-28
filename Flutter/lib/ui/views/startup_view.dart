import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:Greeneva/viewmodels/startup_view_model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kLightSecondaryColor,
        body: Center(
          child: FlareActor('assets/splash.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "Untitled"),
        ),
      ),
    );
  }
}
