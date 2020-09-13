import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/ui/widgets/cicle_button.dart';
import 'package:Greeneva/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../locator.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  /// I'm calling This because I don't like the 50+ Warning about Syntax Error and Blabala.
  /// This does not do any foo  !!!!
  void nothing() {
    print('This Does Nothing LOL :)');
  }

  final DialogService _dialogService = locator<DialogService>();

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    String route = "Account";
    var length = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(width);
    print((width * .4452083333));
    // bool ishome = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: !(width < 710)
            ? Row(
                children: [
                  SizedBox(width: width / 20),
                  Text(
                    'Greeneva.',
                    style: GoogleFonts.merriweatherSans(
                        color: Color(0xff4A69FF), fontSize: 16),
                  ),

                  // Center(
                  //       child: Text(
                  //     '.',
                  //       )),
                  !(width < 1314)
                      ? SizedBox(width: (width / 2.4))
                      : !(width < 500)
                          ? SizedBox(width: (width / 7))
                          : SizedBox(width: (width / 25)),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          route.contains("Account")
                              ? _navigationService.navigateTo(HomeViewRoute)
                              : nothing();
                        },
                        // onTap: () => !ishome,
                        child: Text(
                          'Home'.toUpperCase(),
                          style: GoogleFonts.merriweatherSans(
                              color: Color(0xff4A69FF),
                              fontSize: 16,
                              // letterSpacing: .8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      route.contains("Account")
                          ? Icon(
                              Icons.ac_unit_rounded,
                              color: Colors.green,
                              size: 10,
                            )
                          : null,
                    ],
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Account")
                          ? _navigationService.navigateTo(Help)
                          : nothing();
                    },
                    child: Text(
                      'Help'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Account")
                          ? _navigationService.navigateTo(Donate)
                          // ignore: unnecessary_statements
                          : nothing();
                    },
                    child: Text(
                      'Donate'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Account")
                          ? _navigationService.navigateTo(Contact)
                          : nothing();
                    },
                    child: Text(
                      'Contact'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: (width / 20)),
                  GestureDetector(
                    onTap: () {
                      route.contains("Account") ? nothing() : nothing();
                    },
                    child: Text(
                      'Account'.toUpperCase(),
                      style: GoogleFonts.merriweatherSans(
                          color: Color(0xff4A69FF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : null,
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            // CircleTabIndicator(color: Colors.blue, radius: 4),
            SizedBox(
              height: length / 5,
            ),
            Center(
              child: Text(
                'Welcome',
                style: GoogleFonts.merriweatherSans(
                  fontSize: 50,
                  color: Color(0xff4A69FF),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                width: !(width < 1200)
                    ? width / 3.6
                    : !(width < 720)
                        ? width - (width - (width / 2))
                        : width - 100,
                child: MaterialButton(
                  onPressed: () {
                    LoginViewModel().busy
                        ? nothing()
                        : LoginViewModel().googlelogin();
                  },
                  height: length / 10,
                  minWidth: length / 2,
                  color: Colors.white,
                  child: Row(
                    children: [
                      LoginViewModel().busy
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Image.network(
                              'https://www.freepngimg.com/thumb/google/66893-guava-logo-google-plus-suite-png-image-high-quality.png',
                              height: 50,
                            ),
                      SizedBox(
                        width: 39,
                      ),
                      Center(
                          child: Text(
                        'Sign in with Google',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: !(width < 1200)
                    ? width / 3.6
                    : !(width < 720)
                        ? width - (width - (width / 2))
                        : width - 100,
                child: MaterialButton(
                  onPressed: () {
                    _dialogService.showDialog(
                        title: 'Not Implemented', description: 'Working On It');
                  },
                  height: length / 10,
                  minWidth: length / 2,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image.network(
                        'https://www.hawaiipublicradio.org/sites/khpr/files/201702/Apple_logo_black.svg_.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: 39,
                      ),
                      Center(
                          child: Text(
                        'Sign in with Apple',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 39,
            ),
            Row(
              children: [
                SizedBox(
                  width: !(width < 720) ? width / 2.4 : width / 4,
                ),
                !(LoginViewModel().busy)
                    ? CircleButton(
                        link:
                            "https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-facebook-logo-png-transparent-svg-vector-bie-supply-16.png",
                        iconSize: 50,
                        onPressed: () {
                          print(LoginViewModel().busy);
                          LoginViewModel().facebooklogin();
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(
                  width: 100,
                ),
                CircleButton(
                  link:
                      "https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-logo-vector-png-clipart-1.png",
                  iconSize: 50,

                  /// To be Implented Twitter  Login  LOL :)
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: length / 7,
            ),
            GestureDetector(
              child: Center(
                child: Text(
                  'Continue With Email',
                  style: TextStyle(color: Color(0xff707070), fontSize: 20),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class CircleTabIndicator extends Container {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
