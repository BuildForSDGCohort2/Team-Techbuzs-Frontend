import 'package:Greeneva/Services/authenication_service.dart';
// import 'package:Greeneva/Services/remote_config_service.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/models/user.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // final RemoteConfigService _remoteConfigService =
  //     locator<RemoteConfigService>();

  UserModel get currentUser => _authenticationService.currentUser;

  // Since it'll most likely be used in almost every view we expose it here
  // bool get showMainBanner => _remoteConfigService.showMainBanner;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
