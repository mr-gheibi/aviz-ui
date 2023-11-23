import 'package:flutter/material.dart';

var bottomNavigationBarItems = [
  BottomNavigationBarItem(
    icon: Image.asset('assets/images/bnb-logo-deselect.png'),
    activeIcon: Image.asset('assets/images/bnb-logo.png'),
    label: "آویز آگهی ها",
  ),
  BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/images/bnb-search.png')),
      label: "جستجو"),
  BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline), label: "افزودن آویز"),
  BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined), label: "آویز من"),
].reversed.toList();
