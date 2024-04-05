import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/screens/avizes_tab.dart';
import 'package:aviz/screens/my_aviz.dart';
import 'package:aviz/screens/add_aviz/add_aviz_screen.dart';
import 'package:flutter/material.dart';

import '../data/constants/bottom_navigation_bar_items.dart';
import 'search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedBottomNavigationBarItem;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedBottomNavigationBarItem = bottomNavigationBarItems.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomNavigationBarItem,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => _onBottomNavigationBarItemTapped(index),
        selectedItemColor: primaryColor,
        unselectedItemColor: grey400Color,
        selectedLabelStyle: TextStyle(
          fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
          fontSize: 14,
        ),
        items: bottomNavigationBarItems,
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: IndexedStack(
            index: selectedBottomNavigationBarItem,
            key: UniqueKey(),
            children: [
              Visibility(
                visible: selectedBottomNavigationBarItem == 0,
                child: MyAvizScreen(),
              ),
              Visibility(
                visible: selectedBottomNavigationBarItem == 1,
                child: AddAvizScreen(),
              ),
              Visibility(
                visible: selectedBottomNavigationBarItem == 2,
                child: SearchTab(),
              ),
              Visibility(
                visible: selectedBottomNavigationBarItem == 3,
                child: AvizesTab(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onBottomNavigationBarItemTapped(int index) {
    setState(() {
      selectedBottomNavigationBarItem = index;
    });
  }
}
