import 'package:Greeneva/Services/dynamic_link.dart';
import 'package:Greeneva/Services/theme_provider.dart';
import 'package:Greeneva/ui/Account/Purchase.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:Greeneva/ui/widgets/Profile.dart';
import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../locator.dart';
import 'Privacy.dart';

// import '../../main.dart';

var firebase = FirebaseAuth.instance;
var user = firebase.currentUser;
// var s = user.de

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

    // ScreenUtil.init();
    ScreenUtil.init(
        BoxConstraints.tightFor(
          height: 400,
          width: 400,
        ),
        allowFontScaling: true);
    // ScreenUtil.init(box);

    DynamicLinkService _dynamiclink = locator<DynamicLinkService>();
    _launchURL() async {
      const url = 'mailto:techbuzsgroup@gmail.com?subject=Help+and+Support';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
              ? GestureDetector(
                  onTap: () => user.sendEmailVerification(),
                  child: Container(
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
                    onP: () {
                      showModal(
                          context: context,
                          configuration: FadeScaleTransitionConfiguration(),
                          builder: (context) {
                            return PolicyDialog(
                              mdFileName: 'privacy.md',
                            );
                          });
                    }),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                  onP: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Purchases())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                  onP: () => _launchURL(),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                  onP: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Setting())),
                ),
                ProfileListItem(
                    icon: LineAwesomeIcons.user_plus,
                    text: 'Invite a Friend',
                    onP: () async {
                      var x = await _dynamiclink
                          .createFirstPostLink(user.displayName)
                          .whenComplete(() => {print("Done")});
                      Share.share("Check Out $x");
                    }),
                ProfileListItem(
                    icon: LineAwesomeIcons.user_shield,
                    text: 'Terms & Conditions',
                    onP: () {
                      showModal(
                          context: context,
                          configuration: FadeScaleTransitionConfiguration(),
                          builder: (context) {
                            return PolicyDialog(
                              mdFileName: 'tandc.md',
                            );
                          });
                    }),
                ProfileListItem(
                  onP: () {
                    firebase.signOut();
                    Phoenix.rebirth(context);
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

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Setting")),
        body: Container(
          child: Column(children: [
            SizedBox(height: 30),
            ListTile(
              title: Text("User Name: " + user.displayName + "\n \n"),
              subtitle: Column(children: [
                Text("User UID:  " + user.uid + "\n \n"),
                Text("User Email:  " + user.email + "\n \n"),
                Text("Date Created: " +
                    user.metadata.creationTime.toIso8601String() +
                    " \n \n"),
                CupertinoButton(
                  onPressed: () => user.delete(),
                  child: Text("Delete Account"),
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  onPressed: () {
                    TextEditingController _email = TextEditingController();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    try {
                                      user.updateEmail(_email.text);
                                    } catch (e) {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: new Text("Error"),
                                            content: new Text("$e"),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text("Finish"))
                            ],
                            title: new Text("Change Email"),
                            content: new TextFormField(
                              controller: _email,
                              //  user.email,
                              onChanged: (value) {
                                try {
                                  user.updateEmail(value);
                                } catch (e) {
                                  // Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text("Error"),
                                          content: new Text("$e"),
                                        );
                                      });
                                }
                              },
                            ),
                          );
                        });
                  },
                  child: Text("Change Email Account"),
                  color: Colors.red,
                )
              ]),
            )
          ]),
        ));
  }
}
