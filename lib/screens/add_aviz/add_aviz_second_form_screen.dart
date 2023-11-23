import 'package:aviz/screens/add_aviz/add_aviz_third_map.dart';
import 'package:aviz/widgets/number_text_field.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';

class AddAvizFormScreen extends StatefulWidget {
  const AddAvizFormScreen({super.key});

  @override
  State<AddAvizFormScreen> createState() => _AddAvizFormScreenState();
}

class _AddAvizFormScreenState extends State<AddAvizFormScreen> {
  int step = 3;

  bool hasElevator = false;
  bool hasParking = false;
  bool hasWarehouse = false;

  var dropdownMenuItemsList = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ثبت',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: primaryColor,
              ),
            ),
            Image(image: AssetImage('assets/images/appbar-logo2.png')),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage('assets/images/arrow-right.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        leading: IconButton(icon: Icon(Icons.close), onPressed: () {}),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Divider(
                color: primaryColor,
                thickness: 4,
                indent: 350 - ((step - 1) * 50),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/category.png'),
                        SizedBox(width: 8),
                        Text(
                          'انتخاب دسته بندی آویز',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: grey700Color,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'دسته بندی',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: grey500Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              DropdownMenu(
                                width: 159,
                                hintText: 'دسته بندی',
                                initialSelection: dropdownMenuItemsList.first,
                                // leadingIcon: ImageIcon(AssetImage(
                                //     'assets/images/arrow-down.png')),
                                textStyle: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: grey700Color,
                                ),
                                dropdownMenuEntries: dropdownMenuItemsList
                                    .map(
                                      (e) => DropdownMenuEntry(
                                        value: e,
                                        label: e,
                                        style: ButtonStyle(
                                          textStyle: MaterialStateProperty.all(
                                            TextStyle(
                                              fontFamily: 'Shabnam',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: grey700Color,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'محدوده ملک',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: grey500Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              TextField(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  hintText: 'خیابان صیاد شیرازی',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: grey400Color,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Divider(thickness: 1),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/clipboard.png'),
                        SizedBox(width: 8),
                        Text(
                          'ویژگی ها',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: grey700Color,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'متراژ',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: grey500Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 159,
                                child: NumberTextField(
                                  fillColor: Colors.grey[100],
                                  cursorColor: grey400Color,
                                  fontColor: grey700Color,
                                  fontSize: 24,
                                  iconsColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تعداد اتاق',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: grey500Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 159,
                                child: NumberTextField(
                                  fillColor: Colors.grey[100],
                                  cursorColor: grey400Color,
                                  fontColor: grey700Color,
                                  fontSize: 24,
                                  iconsColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'طبقه',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: grey500Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 159,
                                child: NumberTextField(
                                  fillColor: Colors.grey[100],
                                  cursorColor: grey400Color,
                                  fontColor: grey700Color,
                                  fontSize: 24,
                                  iconsColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'سال ساخت',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: grey500Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: 159,
                                child: NumberTextField(
                                  fillColor: Colors.grey[100],
                                  cursorColor: grey400Color,
                                  fontColor: grey700Color,
                                  fontSize: 24,
                                  iconsColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Divider(thickness: 1),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/magicpen.png'),
                        SizedBox(width: 8),
                        Text(
                          'امکانات',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: grey700Color,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32),
                    Column(
                      children: ['آسانسور', 'پارکینگ', 'انباری'].map(
                        (e) {
                          bool currentBool = false;
                          if (e == 'آسانسور')
                            currentBool = hasElevator;
                          else if (e == 'پارکینگ')
                            currentBool = hasParking;
                          else if (e == 'انباری') currentBool = hasWarehouse;

                          return Container(
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(color: grey300Color)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  e,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: grey700Color,
                                  ),
                                ),
                                Switch(
                                  value: currentBool,
                                  onChanged: (value) {
                                    setState(() {
                                      if (e == 'آسانسور')
                                        hasElevator = value;
                                      else if (e == 'پارکینگ')
                                        hasParking = value;
                                      else if (e == 'انباری')
                                        hasWarehouse = value;
                                    });
                                  },
                                  activeColor: primaryColor,
                                )
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddAvizMapScreen()));
                      },
                      child: Text(
                        'بعدی',
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(343, 40)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
