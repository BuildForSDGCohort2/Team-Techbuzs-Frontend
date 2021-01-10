import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:stacked_services/stacked_services.dart';

import '../locator.dart';

class DynamicLinkService {
  final NavigationServiceM _navigationService = locator<NavigationServiceM>();

  Future handleDynamicLinks() async {
    // Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    // handle link that has been retrieved
    _handleDeepLink(data);

    // Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      // handle link that has been retrieved
      _handleDeepLink(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');

      var isP = deepLink.pathSegments.contains('plant');
      if (isP) {
        var title = deepLink.queryParameters['title'];
        if (title != null) {
          _navigationService.navigateTo(DonationView);
        }
      }
    }
  }

  Future<String> createFirstPostLink(String title) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://filledstacks.page.link',
      link: Uri.parse('https://techbuzs.ml/greeneva?info=$title'),
      androidParameters: AndroidParameters(
        packageName: 'com.techbuzs.greeneva',
      ),

      // Other things to add as an example. We don't need it now
      // iosParameters: IosParameters(
      //   bundleId: 'com.example.ios',
      //   minimumVersion: '1.0.1',
      //   appStoreId: '123456789',
      // ),
      // googleAnalyticsParameters: GoogleAnalyticsParameters(
      //   campaign: 'example-promo',
      //   medium: 'social',
      //   source: 'orkut',
      // ),
      // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
      //   providerToken: '123456',
      //   campaignToken: 'example-promo',
      // ),
      // socialMetaTagParameters: SocialMetaTagParameters(
      //   title: 'Example of a Dynamic Link',
      //   description: 'This link works whether app is installed or not!',
      // ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();

    return dynamicUrl.toString();
  }
}
