import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/Services/theme_provider.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../locator.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var long;
  var lat;
  var location;
  NavigationServiceM _navigationService = locator<NavigationServiceM>();
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Widget _buildImageSvg(String assetName) {
    return Align(
      child: SvgPicture.asset('assets/svgs/$assetName.svg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    var bodyStyle = TextStyle(
        fontSize: 19.0,
        color: themeProvider.isLightTheme ? Colors.black : Colors.white);
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.blue),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: themeProvider.isLightTheme ? Colors.white : Color(0xFF26242e),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Build Teams and Communities",
          body:
              "Greeneva Helps In Building Teams and Communities to Solve the Sustainable Development Goals",
          image: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                SvgPicture.asset('assets/svgs/Onboardin_p2.svg', width: 350.0),
          )),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn about the Sustainable Development Goals",
          body:
              "Get Informated about Each Sustainable Development Goal Target and Indicators. ",
          image: Center(
            child: Center(child: _buildImageSvg('Onboarding_2')),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Make your Impact In Your Community",
          body: "Get Started Today!! ",
          image: _buildImageSvg('Onboarding_3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title:
              "Location Servies \n Accept Location Permission to have a better experience with the app",
          // body: "",
          bodyWidget: CupertinoButton(
              child: Text("Enable Now"),
              color: Colors.green,
              onPressed: () async {
                _determinePosition();
                var permission = await Geolocator.checkPermission();
                if (permission == LocationPermission.always ||
                    permission == LocationPermission.whileInUse) {
                  print("success");
                } else {
                  print("Error");
                }
              }),
          // body:
          //     "Accept Location Permission to have a better experience with the app ",
          image: _buildImageSvg('onb'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _navigationService.navigateTo(SignUpViewRoute),
      onSkip: () => _navigationService.navigateTo(SignUpViewRoute),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('Skip',
          style: TextStyle(
              color: themeProvider.isLightTheme ? Colors.black : Colors.white)),
      next: Icon(
        Icons.arrow_forward,
        color: themeProvider.isLightTheme ? Colors.black : Colors.white,
      ),
      done: Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: themeProvider.isLightTheme ? Colors.black : Colors.white)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
