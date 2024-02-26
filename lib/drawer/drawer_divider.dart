import 'package:flutter/material.dart';
import 'package:johan/drawer/drawer_items.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: DrawerItems.drawerItemColor,
      indent: 5,
      endIndent: 5,
    );
  }
}