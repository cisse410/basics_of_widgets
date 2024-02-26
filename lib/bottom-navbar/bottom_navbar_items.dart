import 'package:flutter/material.dart';

class BottomNavItems {
  static const Color bottomNavItemColor = Colors.blueGrey;
  static Color bottomNavItemSelectedColor = Colors.blue.shade700;

  static final bottomNavItemText = [
    'Accueil',
    'Contacts',
    'Messages',
    'Favoris',
    'Corbeille',
  ];

  static final bottomNavItemIcon = [
    Icons.home,
    Icons.contact_page_rounded,
    Icons.message,
    Icons.bookmarks,
    Icons.delete,
  ];
}
