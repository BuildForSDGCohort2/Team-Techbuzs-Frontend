import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'call_to_action_mobile.dart';
import 'call_to_action_tablet_desktop.dart';
import 'package:Greeneva/extensions/hover_extension.dart';

class CallToAction extends StatelessWidget {
  // final String title;
  CallToAction(this.length, this.link, this.name, this.onPress);
  final double length;
  final String link;
  final String name;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
            // mobile: CallToActionMobile(title),
            tablet: CallToActionTabletDesktop(length, link, name, onPress))
        .showCursorOnHover
        .moveUpOnHover;
  }
}
