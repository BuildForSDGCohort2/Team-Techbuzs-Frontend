import 'package:Greeneva/Services/analytics_service.dart';
import 'package:Greeneva/Services/authenication_service.dart';
import 'package:Greeneva/Services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'Services/dialog_service.dart';
import 'Services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NavigationServiceM());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => AnalyticsService());
  // if (!kIsWeb) {
  // var remoteConfigService = await RemoteConfigService.getInstance();
  // locator.registerSingleton(remoteConfigService);
  // }
}
