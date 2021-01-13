import 'package:Greeneva/ui/Account/Privacy.dart';
import 'package:Greeneva/ui/Auth/login_view.dart';
import 'package:Greeneva/viewmodels/login_view_model.dart';
import 'package:Greeneva/viewmodels/signup_view_model.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Greeneva/Services/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  final localityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool busy = false;
    var lat;
    var long;
    var location = "";
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                backgroundColor: !(themeProvider.isLightTheme)
                    ? Color(0xFF26242e)
                    : Colors.white,
                body: SingleChildScrollView(
                  physics: PageScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 40.0, top: 40),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Cardo',
                                  fontSize: 35,
                                  color: themeProvider.isLightTheme
                                      ? Color(0xff0C2551)
                                      : Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              //
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40, top: 5),
                              child: Text(
                                'Sign up with',
                                style: TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 15,
                                  color: (themeProvider.isLightTheme)
                                      ? Colors.grey
                                      : Colors.white24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          //
                          SizedBox(
                            height: 30,
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(left: 38),
                            child: Row(
                              children: [
                                Newbutton(
                                  onP: () => LoginViewModel().googlelogin(),
                                  char:
                                      'https://techbuzs.github.io/I/Google.png',
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Newbutton(
                                  onP: () => LoginViewModel().facebooklogin(),
                                  char: 'https://techbuzs.github.io/I/FB.png',
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Newbutton(
                                  onP: () => LoginViewModel().twitterlogin(),
                                  char:
                                      'https://techbuzs.github.io/I/Twitter-Logo.png',
                                )
                              ],
                            ),
                          ),
                          //

                          SizedBox(
                            height: 30,
                          ),
                          //
                          MyCustomInputBox(
                            label: 'Name',
                            inputHint: 'Juwon R.',
                            kTextEditingController: fullNameController,
                          ),
                          //
                          SizedBox(
                            height: 30,
                          ),
                          //
                          MyCustomInputBox(
                            label: 'Email',
                            inputHint: 'juwonr@greeneva.com',
                            kTextEditingController: emailController,
                          ),
                          //
                          SizedBox(
                            height: 30,
                          ),
                          //
                          MyCustomInputBox(
                            label: 'Password',
                            kTextEditingController: passwordController,
                            inputHint: '8+ Characters,1 Capital letter',
                          ),
                          //
                          SizedBox(
                            height: 30,
                          ),
                          //
                          GestureDetector(
                            onTap: () {
                              showModal(
                                  context: context,
                                  configuration:
                                      FadeScaleTransitionConfiguration(),
                                  builder: (context) {
                                    return PolicyDialog(
                                      mdFileName: 'tandc.md',
                                    );
                                  });
                            },
                            child: Text(
                              "Creating an account means you're okay with\nour Terms of Service and Privacy Policy",
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 15.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8f9db5).withOpacity(0.45),
                              ),
                              //
                            ),
                          ),
                          model.busy == true
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  width: scrWidth * 0.35,
                                  height: 53,
                                  decoration: BoxDecoration(
                                    // color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    // widthFactor: 2,
                                    child: CircularProgressIndicator(),
                                  ))
                              : CupertinoButton(
                                  onPressed: () async {
                                    busy = true;
                                    _determinePosition();
                                    var permission =
                                        await Geolocator.checkPermission();
                                    if (permission ==
                                            LocationPermission.always ||
                                        permission ==
                                            LocationPermission.whileInUse) {
                                      Position position =
                                          await Geolocator.getCurrentPosition(
                                              desiredAccuracy:
                                                  LocationAccuracy.high);
                                      long = position.longitude;
                                      lat = position.latitude;
                                      final coordinates =
                                          new Coordinates(lat, long);
                                      var addresses = await Geocoder.local
                                          .findAddressesFromCoordinates(
                                              coordinates);

                                      location = addresses.first.toString();
                                      log(location);
                                    }
                                    model.signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        fullName: fullNameController.text,
                                        location: location);
                                    busy = false;
                                  },
                                  child: Center(
                                    child: Text(
                                      'Create an Account',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                          GestureDetector(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginView())),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xff8f9db5).withOpacity(0.45),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff90b7ff),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ClipPath(
                        clipper: OuterClippedPart(),
                        child: Container(
                          color: Color(0xff0962ff),
                          width: scrWidth,
                          height: scrHeight,
                        ),
                      ),
                      //
                      ClipPath(
                        clipper: InnerClippedPart(),
                        child: Container(
                          color: Color(0xff0c2551),
                          width: scrWidth,
                          height: scrHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class Newbutton extends StatelessWidget {
  final String char;
  final Function onP;
  Newbutton({this.char, this.onP});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onP,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(12, 11),
              blurRadius: 26,
              color: Color(0xffaaaaaa).withOpacity(0.1),
            )
          ],
        ),
        //
        child: Center(child: Image.network(char)),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCustomInputBox extends StatefulWidget {
  final String label;
  final String inputHint;
  final TextEditingController kTextEditingController;

  MyCustomInputBox({this.label, this.inputHint, this.kTextEditingController});
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  bool isSubmitted = false;
  final checkBoxIcon = 'assets/checkbox.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, bottom: 8),
            child: Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                color: Color(0xff8f9db5),
              ),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
            controller: widget.kTextEditingController,
            obscureText: widget.label == 'Password' ? true : false,
            // this can be changed based on usage -
            // such as - onChanged or onFieldSubmitted
            onChanged: (value) {
              setState(() {
                isSubmitted = true;
              });
            },
            style: TextStyle(
                fontSize: 10,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: widget.inputHint,
              hintStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w600),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 27, horizontal: 25),
              focusColor: Color(0xff0962ff),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xff0962ff)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey[350],
                ),
              ),
              suffixIcon: isSubmitted == true
                  // will turn the visibility of the 'checkbox' icon
                  // ON or OFF based on the condition we set before
                  ? Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          checkBoxIcon,
                          height: 0.2,
                        ),
                      ),
                    )
                  : Visibility(
                      visible: false,
                      child: SvgPicture.asset(checkBoxIcon),
                    ),
            ),
          ),
        ),
        //
      ],
    );
  }
}

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
