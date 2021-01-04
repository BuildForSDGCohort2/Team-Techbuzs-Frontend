import 'package:Greeneva/Services/theme_provider.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:Greeneva/ui/widgets/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

// import '../../main.dart';

var firebase = FirebaseAuth.instance;
var user = firebase.currentUser;

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var spinkit = SpinKitRotatingCircle(
    color: Colors.red,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    var firebase = FirebaseAuth.instance;
    var user = firebase.currentUser;
    return user != null
        ? ProfileScreen()
        : Scaffold(body: Container(child: spinkit));
  }
}

String provider(var info) {
  if (info.toString().contains("twitter")) {
    if (user.displayName == "twitter") {
      return "";
    }
    return "Twitter";
  } else {
    if (info.toString().contains("facebook")) {
      if (user.displayName == "facebook") {
        return "";
      }
      return "Facebook";
    } else {
      if (info.toString().contains("google")) {
        if (user.displayName == "google") {
          return "";
        }
        return "Google";
      } else {
        return "Normal";
      }
    }
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                    radius: kSpacingUnit.w * 5,
                    backgroundImage: user.photoURL == null
                        ? AssetImage('assets/g.png')
                        : NetworkImage(user.photoURL)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            user.displayName == null ? 'John Deo' : user.displayName,
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            user.email == null
                ? 'JohnDeo@greeneva.com'
                : provider(user.providerData) == "Normal" ||
                        provider(user.providerData) == "Google"
                    ? user.email
                    : provider(user.providerData),
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          provider(user.providerData) == "Normal" && user.emailVerified == false
              ? Container(
                  height: kSpacingUnit.w * 4,
                  width: kSpacingUnit.w * 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Center(
                    child: Text(
                      'Verify Email',
                      style: kButtonTextStyle,
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                )
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        // Icon(
        //   // LineAwesomeIcons.arrow_left,
        //   size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        // ),
        profileInfo,
        // themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      backgroundColor:
          themeProvider.isLightTheme ? Colors.white : Color(0xFF26242e),
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite a Friend',
                ),
                ProfileListItem(
                  onP: () {
                    firebase.signOut();
                    // RestartWidget.restartApp(context);
                  },
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
