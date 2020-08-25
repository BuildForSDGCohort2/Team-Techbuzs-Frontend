// import 'package:Greeneva/Services/analytics_service.dart';
// import 'package:Greeneva/Services/authenication_service.dart';
// import 'package:Greeneva/Services/dialog_service.dart';
// import 'package:Greeneva/Services/navigation_service.dart';
// import 'package:Greeneva/constants/routename.dart';
// import 'package:Greeneva/locator.dart';
// import 'package:flutter/material.dart';

// import 'base_model.dart';

// class HomeViewModel extends BaseModel {
//   final AuthenticationService _authenticationService =
//       locator<AuthenticationService>();
//   final DialogService _dialogService = locator<DialogService>();
//   final NavigationService _navigationService = locator<NavigationService>();
//   final AnalyticsService _analyticsService = locator<AnalyticsService>();

//   Future signout({

//   }) async {
//     setBusy(true);

//     var result = true;

//     setBusy(false);

//     if (result is bool) {
//       if (result) {
//         await _analyticsService.logLogin();
//         _navigationService.navigateTo(HomeViewRoute);
//       } else {
//         await _dialogService.showDialog(
//           title: 'Login Failure',
//           description: 'General login failure. Please try again later',
//         );
//       }
//     } else {
//       await _dialogService.showDialog(
//         title: 'Login Failure',
//         description: result,
//       );
//     }
//   }

//   void navigateToSignUp() {
//     _navigationService.navigateTo(SignUpViewRoute);
//   }
// }
