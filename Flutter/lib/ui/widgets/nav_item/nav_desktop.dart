import 'package:Greeneva/ui/widgets/nav_item/nav_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class NavBarItemTabletDesktop extends ViewModelWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title.toUpperCase(),
      style: GoogleFonts.merriweatherSans(
          color: Color(0xff4A69FF),
          fontSize: 16,
          // letterSpacing: .8,
          fontWeight: FontWeight.bold),
    );
  }
}
