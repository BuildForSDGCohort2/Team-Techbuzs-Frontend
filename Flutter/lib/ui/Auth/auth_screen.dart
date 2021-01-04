// import 'package:Greeneva/Services/dialog_service.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/viewmodels/login_view_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../locator.dart';
// import '../login_view.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  NavigationServiceM _navigationService = locator<NavigationServiceM>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: WebsafeSvg.asset(
              'assets/svgs/Login_Background.svg',
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.cormorantUpright(
                        color: Color(0xff4A69FF), fontSize: 45),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: MaterialButton(
                      onPressed: () {
                        LoginViewModel().googlelogin();
                      },
                      height: 70,
                      // minWidth: length / 2,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.network(
                            'https://www.freepngimg.com/thumb/google/66893-guava-logo-google-plus-suite-png-image-high-quality.png',
                            height: 50,
                          ),
                          SizedBox(
                            width: 33,
                          ),
                          Center(
                              child: Text(
                            'Sign in with Google',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: MaterialButton(
                      onPressed: () {},
                      height: 70,
                      // minWidth: length / 2,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logo/apple.png',
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
                                fontSize: 20),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !(LoginViewModel().busy)
                        ? IconButton(
                            iconSize: 50,
                            icon: Container(
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                    color: Colors.blue, width: 3.0),
                                image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/logo/facebook.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onPressed: () => LoginViewModel().facebooklogin(),
                          )
                        : Center(child: CircularProgressIndicator()),
                    SizedBox(
                      width: 100,
                    ),

                    !(LoginViewModel().busy)
                        ? IconButton(
                            iconSize: 50,
                            icon: Container(
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                    color: Colors.blue, width: 3.0),
                                image: new DecorationImage(
                                  image:
                                      new AssetImage("assets/logo/twitter.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onPressed: () => LoginViewModel().facebooklogin(),
                          )
                        : Center(child: CircularProgressIndicator()),
                    // CircleButton(
                    //   icon: MdiIcons.twitter,
                    //   iconSize: 50,
                    //   onPressed: () {},
                    // )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkResponse(
                      onTap: () =>
                          _navigationService.navigateTo(LoginViewRoute),
                      child: Text(
                        'Continue with Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
