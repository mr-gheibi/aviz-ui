import 'package:aviz/data/constants/avizes.dart';
import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/screens/add_aviz/add_aviz_first_screen.dart';
import 'package:aviz/screens/aviz_single_page_screen.dart';
import 'package:aviz/screens/my_aviz.dart';
import 'package:flutter/material.dart';

import '../data/constants/bottom_navigation_bar_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedBottomNavigationBarItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedBottomNavigationBarItem = bottomNavigationBarItems.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getAppBarTitle(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: selectedBottomNavigationBarItem < 3 && selectedBottomNavigationBarItem != 0
            ? [
                IconButton(
                  icon: ImageIcon(AssetImage('assets/images/arrow-right.png')),
                  onPressed: () {},
                ),
              ]
            : [],
        leading: selectedBottomNavigationBarItem < 3 && selectedBottomNavigationBarItem != 0
            ? IconButton(icon: Icon(Icons.close), onPressed: () {})
            : null,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomNavigationBarItem,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => _onBottomNavigationBarItemTapped(index),
        selectedItemColor: primaryColor,
        unselectedItemColor: grey400Color,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Shabnam',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Shabnam',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        items: bottomNavigationBarItems,
      ),
      body: SafeArea(
        child: _getCurrentTabScreen(),
      ),
    );
  }

  Widget _getAppBarTitle() {
    switch (selectedBottomNavigationBarItem) {
      case 0:
        return Image(image: AssetImage('assets/images/myaviz-logo.png'));
      case 1:
        return Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'دسته بندی',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            Image(image: AssetImage('assets/images/appbar-logo2.png')),
          ],
        );
      case 3:
        return Image(image: AssetImage('assets/images/appbar-logo.png'));
      default:
        return Image(image: AssetImage('assets/images/appbar-logo.png'));
    }
  }

  Widget _getCurrentTabScreen() {
    switch (selectedBottomNavigationBarItem) {
      case 0:
        return MyAvizScreen();
      case 1:
        return AddAvizScreen();
      case 2:
        return SearchTab();
      case 3:
        return HomeTab();
      default:
        return HomeTab();
    }
  }

  void _onBottomNavigationBarItemTapped(int index) {
    setState(() {
      selectedBottomNavigationBarItem = index;
    });
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '404 Error - No UI Design Found ! :)',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          _getTitle('آویز های داغ'),
          _getHotAvizes(),
          _getTitle('آویز های اخیر'),
          _getRecentAvizes(),
        ],
      ),
    );
  }

  Widget _getTitle(String title) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: grey700Color,
                ),
              ),
              Text(
                'مشاهده همه',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: grey500Color,
                ),
              ),
            ],
          ),
          SizedBox(height: 24)
        ],
      ),
    );
  }

  Widget _getHotAvizes() {
    return SliverToBoxAdapter(
      child: Container(
        height: 267,
        width: double.infinity,
        child: ListView.builder(
          itemCount: all_avizes_list.length,
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AvizSinglePageScreen(aviz: all_avizes_list[index])));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                width: 224,
                height: 267,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.02),
                      offset: Offset.fromDirection(0, 4),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.02),
                      offset: Offset.fromDirection(0, 18),
                      blurRadius: 18,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.01),
                      offset: Offset.fromDirection(0, 40),
                      blurRadius: 24,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      offset: Offset.fromDirection(0, 70),
                      blurRadius: 28,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      offset: Offset.fromDirection(0, 110),
                      blurRadius: 31,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage(
                          all_avizes_list[index].photoAddress,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          all_avizes_list[index].name,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: grey700Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            all_avizes_list[index].description,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: grey500Color,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'قیمت:',
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: grey700Color,
                          ),
                        ),
                        Container(
                          color: grey100Color,
                          child: Text(
                            all_avizes_list[index].price,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: primaryColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getRecentAvizes() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AvizSinglePageScreen(aviz: all_avizes_list[index])));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 16),
              height: 139,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.02),
                    offset: Offset.fromDirection(0, 4),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.02),
                    offset: Offset.fromDirection(0, 18),
                    blurRadius: 18,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.01),
                    offset: Offset.fromDirection(0, 40),
                    blurRadius: 24,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0),
                    offset: Offset.fromDirection(0, 70),
                    blurRadius: 28,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0),
                    offset: Offset.fromDirection(0, 110),
                    blurRadius: 31,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            all_avizes_list[index].name,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: grey700Color,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            all_avizes_list[index].description,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: grey500Color,
                            ),
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  'قیمت:',
                                  textAlign: TextAlign.end,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: grey700Color,
                                  ),
                                ),
                                Container(
                                  color: grey100Color,
                                  child: Text(
                                    all_avizes_list[index].price,
                                    style: TextStyle(
                                      fontFamily: 'Shabnam',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage(all_avizes_list[index].photoAddress),
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: all_avizes_list.length,
      ),
    );
  }
}
