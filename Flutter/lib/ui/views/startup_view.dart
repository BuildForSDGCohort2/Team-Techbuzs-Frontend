import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/viewmodels/startup_view_model.dart';
// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dart:math' as math;

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 5), () => _navigationService.navigateTo(Startup));
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6))
          ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffafafa),
      // appBar: AppBar(),
      child: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Center(
              child: Image.asset(
                'assets/greeneva.png',
                height: 150,
              ),
            )),
      ),
    );
  }
}

class StartUpView extends StatefulWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  _StartUpViewState createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6))
          ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: Center(
                    child: Image.asset(
                      'assets/greeneva.png',
                      height: 150,
                    ),
                  )),
              // CircularProgressIndicator(
              //   strokeWidth: 3,
              //   valueColor: AlwaysStoppedAnimation(
              //     Theme.of(context).primaryColor,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
