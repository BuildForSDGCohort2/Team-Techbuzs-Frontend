import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';
import 'package:flutter/material.dart';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationServiceM _navigationService = locator<NavigationServiceM>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  Future twitterlogin() async {
    try {
      setBusy(true);
      await _authenticationService.signInWithTwitter();
      setBusy(false);
      await _analyticsService.logLoginTwitter();
      _navigationService.navigateTo(HomeViewRoute);
    } catch (e) {
      _dialogService.showDialog(
          title: "Twitter Sign-In Error ", description: e.toString());
      print(e.message);
      //  setBusy(false);
    }
  }

  Future googlelogin() async {
    try {
      setBusy(true);
      await _authenticationService.signInWithGoogle();
      setBusy(false);
      await _analyticsService.logLogingoogle();
      _navigationService.navigateTo(HomeViewRoute);
    } catch (e) {
      _dialogService.showDialog(
          title: "Google Sign-In Error ", description: e.toString());
      print(e.message);
      //  setBusy(false);
    }
  }

  Future facebooklogin() async {
    try {
      setBusy(true);

      await _authenticationService.signInWithFacebook();
      await _analyticsService.logLoginFacebook();
      setBusy(false);
      _navigationService.navigateTo(HomeViewRoute);
    } catch (e) {
      setBusy(false);

      print(e);
      await _dialogService.showDialog(
          title: 'FaceBook  Error', description: '${e.toString()}');
      //  setBusy(false);
    }
  }

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        await _analyticsService.logLogin();
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
