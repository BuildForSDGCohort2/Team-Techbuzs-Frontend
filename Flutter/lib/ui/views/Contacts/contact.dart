// import 'package:Greeneva/ui/views/Auth/auth_screen.dart';
import 'package:Greeneva/ui/views/Contacts/contact_page.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:Greeneva/extensions/hover_extension.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ContactPage(),
      tablet: ContactPage(),
    ).showCursorOnHover.moveUpOnHover;
  }
}
