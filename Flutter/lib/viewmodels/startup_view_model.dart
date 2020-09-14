import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
// import 'package:Greeneva/Services/remote_config_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  // final PushNotificationService _pushNotificationService =
  //     locator<PushNotificationService>();
  //TODO Work on dynamic Links
  // final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  // final RemoteConfigService _remoteConfigService =
  //     locator<RemoteConfigService>();

  Future handleStartUpLogic() async {
    // print(hasLoggedInUser);

    // await _dynamicLinkService.handleDynamicLinks();
    // await _remoteConfigService.initialise();

    // Register for push notifications
    // await _pushNotificationService.initialise();

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    print(hasLoggedInUser);

    if (hasLoggedInUser) {
      print('Home');

      _navigationService.navigateTo(Layout, arguments: HomeViewRoute);
      // Navigat
    } else {
      // _navigationService.navigateTo(LoginViewRoute);
      print('Auth');
      _navigationService.navigateTo(Layout);
    }
  }
}
