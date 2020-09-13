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
  final NavigationService _navigationService = locator<NavigationService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  Future googlelogin() async {
    try {
      setBusy(true);
      await _authenticationService.signInWithGoogle();
      setBusy(false);
      await _analyticsService.logLogingoogle();
      _navigationService.navigateTo(HomeViewRoute);
    } catch (e) {
      print(e.message);
      await _dialogService.showDialog(
          title: 'Google Sign In Error', description: 'Error: ${e.toString()}');
      setBusy(false);
    }
  }

  Future facebooklogin() async {
    try {
      setBusy(true);
      await _authenticationService.signInWithFacebook();
      await _analyticsService.logLoginfacebook();
      setBusy(false);
      _navigationService.navigateTo(HomeViewRoute);
    } catch (e) {
      print(e.message);
      await _dialogService.showDialog(
          title: 'Google Sign In Error', description: 'Error: ${e.toString()}');
      setBusy(false);
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
