import 'package:Greeneva/ui/shared/ui_helper.dart';
import 'package:Greeneva/ui/widgets/busy_button.dart';
import 'package:Greeneva/ui/widgets/input_field.dart';
import 'package:Greeneva/viewmodels/login_view_model.dart';
import 'package:Greeneva/viewmodels/signup_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';

// class SignUpView extends StatefulWidget {
//   @override
//   _SignUpViewState createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   var lat;
//   var long;

//   @override
//   void initState() {
//     super.initState();
//   }

//   final emailController = TextEditingController();

//   final passwordController = TextEditingController();

//   final fullNameController = TextEditingController();
//   final localityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<SignUpViewModel>.reactive(
//       viewModelBuilder: () => SignUpViewModel(),
//       builder: (context, model, child) => Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 50.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   fontSize: 38,
//                 ),
//               ),
//               verticalSpaceLarge,
//               InputField(
//                 placeholder: 'Full Name',
//                 controller: fullNameController,
//               ),
//               verticalSpaceSmall,
//               InputField(
//                 placeholder: 'Email',
//                 controller: emailController,
//               ),
//               verticalSpaceSmall,
//               InputField(
//                 placeholder: 'Password',
//                 password: true,
//                 controller: passwordController,
//                 additionalNote: 'Password has to be a minimum of 6 characters.',
//               ),
//               verticalSpaceSmall,
//               InputField(
//                 placeholder: 'Locality',
//                 password: false,
//                 controller: localityController,
//               ),
//               verticalSpaceSmall,
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   BusyButton(
//                     title: 'Sign Up',
//                     busy: model.busy,
//                     onPressed: () {
//                       _determinePosition();
//                       var permission = await Geolocator.checkPermission();
//                       if (permission == LocationPermission.always ||
//                           permission == LocationPermission.whileInUse) {
//                         Position position = await Geolocator.getCurrentPosition(
//                             desiredAccuracy: LocationAccuracy.high);
//                         long = position.longitude;
//                         lat = position.latitude;
//                         final coordinates = new Coordinates(lat, long);
//                         var addresses = await Geocoder.local
//                             .findAddressesFromCoordinates(coordinates);
//                         location = addresses.first;
//                       }
//                       model.signUp(
//                           email: emailController.text,
//                           password: passwordController.text,
//                           fullName: fullNameController.text,
//                           location: localityController.text);
//                     },
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  final localityController = TextEditingController();
  bool busy = false;
  var lat;
  var long;
  var location;

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
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
                                  color: Color(0xff0C2551),
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
                                  color: Colors.grey,
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
                                Neu_button(
                                  onP: () => LoginViewModel().googlelogin(),
                                  char:
                                      'https://ddo0fzhfvians.cloudfront.net/uploads/icons/png/37468251556105321-512.png',
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Neu_button(
                                  onP: () => LoginViewModel().facebooklogin(),
                                  char:
                                      'https://1000logos.net/wp-content/uploads/2016/11/Facebook-logo-500x350.png',
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Neu_button(
                                  onP: () => LoginViewModel().twitterlogin(),
                                  char:
                                      'https://logos-world.net/wp-content/uploads/2020/04/Twitter-Logo.png',
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
                            inputHint: 'John',
                            kTextEditingController: fullNameController,
                          ),
                          //
                          SizedBox(
                            height: 30,
                          ),
                          //
                          MyCustomInputBox(
                            label: 'Email',
                            inputHint: 'example@example.com',
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
                          Text(
                            "Creating an account means you're okay with\nour Terms of Service and Privacy Policy",
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff8f9db5).withOpacity(0.45),
                            ),
                            //
                          ),
                          busy == true
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
                              : GestureDetector(
                                  onTap: () async {
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
                                      location = addresses.first;
                                    }
                                    model.signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        fullName: fullNameController.text,
                                        location: location);
                                    busy = false;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    width: scrWidth * 0.85,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      color: Color(0xff0962ff),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Create an Account',
                                        style: TextStyle(
                                          fontFamily: 'ProductSans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8f9db5).withOpacity(0.45),
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

class Neu_button extends StatelessWidget {
  Neu_button({this.char, this.onP});
  String char;
  Function onP;
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
  String label;
  String inputHint;
  TextEditingController kTextEditingController;

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
                fontSize: 19,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: widget.inputHint,
              hintStyle: TextStyle(
                  fontSize: 18,
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
