import 'package:flutter/material.dart';
import 'package:johan/drawer/drawer_items.dart';

var indexClick = 0;

class DrawerItemsTile extends StatelessWidget {
  const DrawerItemsTile({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClick == index,
        selectedTileColor: DrawerItems.drawerSelectedTileColor,
        leading: Icon(
          DrawerItems.drawerItemIcon[index],
          size: 30,
          color: indexClick == index
              ? DrawerItems.drawerItemSelectedColor
              : DrawerItems.drawerItemColor,
        ),
        title: Text(
          DrawerItems.drawerItemText[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClick == index
                ? DrawerItems.drawerItemSelectedColor
                : DrawerItems.drawerItemColor,
          ),
        ),
      ),
    );
  }
}
