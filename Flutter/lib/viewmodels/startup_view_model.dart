import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
// import 'package:Greeneva/Services/remote_config_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationServiceM _navigationService = locator<NavigationServiceM>();
  // final PushNotificationService _pushNotificationService =
  //     locator<PushNotificationService>();
  //TODO Work on dynamic Links
  // final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  // final RemoteConfigService _remoteConfigService =
  //     locator<RemoteConfigService>();

  // Timer(Duration(seconds: 5), () => )\

  Future handleStartUpLogic() async {
    // await _dynamicLinkService.handleDynamicLinks();
    // await _remoteConfigService.initialise();

    // Register for push notifications
    // await _pushNotificationService.initialise();
    print("Are u here");

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser ?? false) {
      Future.delayed(Duration(seconds: 5),
          () => _navigationService.navigateTo(NavBarView));
    } else {
      Future.delayed(Duration(seconds: 5),
          () => _navigationService.navigateTo(OnBoarding));
    }
  }
}
