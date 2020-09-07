import 'package:Greeneva/ui/cicle_button.dart';
import 'package:Greeneva/ui/custom_tab_bar.dart';
import 'package:Greeneva/ui/user_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  // final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> name;

  const CustomAppBar({
    Key key,
    // @required this.currentUser,
    @required this.icons,
    this.name,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Greeneva',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          // Container(
          //   height: double.infinity,
          //   width: 600.0,
          //   child: CustomTabBar(
          //     icons: icons,
          //     selectedIndex: selectedIndex,
          //     onTap: onTap,
          //     name: name,
          //     isBottomIndicator: true,
          //   ),
          // ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // UserCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
