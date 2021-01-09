import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/dynamic_link.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/Services/push_not.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationServiceM _navigationService = locator<NavigationServiceM>();
    final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();

  Future handleStartUpLogic() async {
    /// Handle Dynamic Link Before the App Start 
 await _dynamicLinkService.handleDynamicLinks();
    
    /// And Also Register for push notifications
    await _pushNotificationService.initialise();
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
