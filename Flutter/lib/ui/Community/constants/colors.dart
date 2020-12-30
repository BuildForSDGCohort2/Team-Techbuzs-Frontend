import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);
Color primaryTextColor = Color(0xFF414C6B);
Color secondaryTextColor = Color(0xFFE4979E);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color navigationColor = Color(0xFF6751B5);
Color gradientStartColor = Colors.green;
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
// const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;
Color gradientEndColor = Colors.greenAccent;
const kBlueColor = Color(0xFF1E1E99);
const kTwentyBlueColor = Color(0x201E1E99);
const kPinkColor = Color(0xFFFF70A3);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF3A3A3A);
const kTenBlackColor = Color(0x10000000);
const kBackgroundColor = Color(0xFFFAFAFA);
const kGreyColor = Color(0xff8A959E);
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);

const LIGHT_GREEN = Color.fromRGBO(60, 232, 211, 1);
const DARK_GREEN = Color.fromRGBO(0, 152, 161, 1);

const CRIMSON_RED = Color.fromRGBO(163, 35, 35, 1);
const DARK_RED = Color.fromRGBO(124, 2, 2, 1);
const LIGHT_RED = Color.fromRGBO(255, 126, 126, 1);

const WHITE_COLOR = Colors.white;
const BLACK_COLOR = Colors.black;

const LIGHT_GREY_COLOR = Color.fromRGBO(241, 241, 241, 1);

const DARK_ORANGE = Color.fromRGBO(214, 68, 5, 1);
const PALE_ORANGE = Color.fromRGBO(247, 126, 74, 1);

const BLUE_SHADOW = Color.fromRGBO(0, 172, 183, 0.2);
const ORANGE_SHADOW = Color.fromRGBO(254, 137, 0, 0.2);

const PURPLE_COLOR = Color.fromRGBO(115, 130, 255, 1);
const DARK_PURPLE_COLOR = Color.fromRGBO(28, 34, 87, 1);
