import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

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