import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';

import 'package:flutter/foundation.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogServiceM _dialogService = locator<DialogServiceM>();
  final NavigationServiceM _navigationService = locator<NavigationServiceM>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  String _selectedRole = 'Select a User Role';

  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future signUp(
      {@required String email,
      @required String password,
      @required String fullName,
      String location}) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        location: location);

    setBusy(false);

    if (result is bool) {
      if (result) {
        await _analyticsService.logSignUp();
        _navigationService.navigateTo(NavBarView);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
