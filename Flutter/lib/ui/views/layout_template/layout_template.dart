import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';
import 'package:Greeneva/ui/widgets/center_view/center_view.dart';
import 'package:Greeneva/ui/widgets/nav_bar/navigation_bar.dart';
import 'package:Greeneva/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router.dart';

class LayoutTemplate extends StatelessWidget {
  LayoutTemplate({Key key, this.argument}) : super(key: key);
  final String argument;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationServiceM>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: AuthView,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
