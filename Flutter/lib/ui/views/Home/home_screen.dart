import 'package:Greeneva/ui/views/Home/home_screen_desktop.dart';
import 'package:Greeneva/ui/views/Home/home_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:Greeneva/extensions/hover_extension.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeContentMobile(),
      desktop: HomeContentDesktop(),
    ).showCursorOnHover.moveUpOnHover;
  }
}
