import 'package:flutter/material.dart';

class DrawerItems {
  static Color drawerItemColor = Colors.grey.shade900;
  static Color drawerItemSelectedColor = Colors.blue.shade700;
  static Color drawerSelectedTileColor = Colors.blue.shade100;

  static final drawerItemText = [
    'Accueil',
    'Contacts',
    'Favoris',
    'Messages',
    'Corbeille',
    'Paramètres',
    'Partager l\'application'
  ];

  static final drawerItemIcon = [
    Icons.home,
    Icons.contact_page_rounded,
    Icons.bookmarks,
    Icons.message,
    Icons.delete,
    Icons.settings,
    Icons.share,
  ];
}
