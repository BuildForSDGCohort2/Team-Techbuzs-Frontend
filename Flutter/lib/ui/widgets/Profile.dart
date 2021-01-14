import 'package:Greeneva/Services/theme_provider.dart';
import 'package:Greeneva/ui/Community/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final Function onP;

  const ProfileListItem({
    Key key,
    this.icon,
    this.onP,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: onP,
      child: Container(
        // color: themeProvider.isLightTheme
        //     ? Colors.blue != null
        //         ? Colors.white
        //         : Colors.white
        //     : Colors.white,
        height: kSpacingUnit.w * 5.5,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit.w * 4,
        ).copyWith(
          bottom: kSpacingUnit.w * 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit.w * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
          color:
              !(themeProvider.isLightTheme) ? Colors.white : Color(0xFF26242e),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
              size: kSpacingUnit.w * 2.5,
              color: (themeProvider.isLightTheme)
                  ? Colors.white
                  : Color(0xFF26242e),
            ),
            SizedBox(width: kSpacingUnit.w * 1.5),
            Text(
              this.text,
              style: kTitleTextStyle.copyWith(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: (themeProvider.isLightTheme)
                    ? Colors.white
                    : Color(0xFF26242e),
              ),
            ),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: kSpacingUnit.w * 2.5,
              ),
          ],
        ),
      ),
    );
  }
}
