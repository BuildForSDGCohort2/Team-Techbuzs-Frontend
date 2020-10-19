import 'package:flutter/material.dart';
// import 'package:';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:Greeneva/ui/views/Auth/auth_screen.dart';

import '../Home/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AuthScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: WebsafeSvg.asset('assets/$assetName.svg', width: 500.0),
      alignment: Alignment.bottomLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // pageColor: Colors.white,
      pageColor: Color(0xffF7F8FA),

      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
         
          title: "Build Teams and Communities",
          body: "Work with Other people to build Teams and Communities in order to come closer to achieve the Sustainable Development Goals ",
          // "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.",
          image: _buildImage('Onboarding_1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn About \n The Sustainable Development Goals",
          body:
              "Educate yourself on them Sustainable Development Goals and checkout targets and indicators for the Sustainable Development Goals",
          image: _buildImage('Onboarding_2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Donate and Help Organizations",
          body:
              "On Greeneva donate to organizations and help to achieve the Sustainable Development Goals",
          image: _buildImage('Onboarding_3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
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
