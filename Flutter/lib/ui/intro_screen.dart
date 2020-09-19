import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
// import 'package:Greeneva/ui/views/auth_screen.dart';
import 'package:flutter/material.dart';

// import 'package:';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../locator.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  NavigationService _navigationService = locator<NavigationService>();
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildImageSvg(String assetName) {
    return Align(
      child: WebsafeSvg.asset('assets/svgs/$assetName.svg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.blue),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
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
                WebsafeSvg.asset('assets/svgs/Onboardin_p2.svg', width: 350.0),
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
          image: _buildImageSvg('Onboarding_3.svg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _navigationService.navigateTo(SignUpViewRoute),
      onSkip: () => _navigationService.navigateTo(SignUpViewRoute),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
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
