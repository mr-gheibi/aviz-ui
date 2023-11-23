import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';

class AddAvizLastFormScreen extends StatefulWidget {
  const AddAvizLastFormScreen({super.key});

  @override
  State<AddAvizLastFormScreen> createState() => _AddAvizLastFormScreenState();
}

class _AddAvizLastFormScreenState extends State<AddAvizLastFormScreen> {
  int step = 5;

  bool chatSwitchStatus = false;
  bool callSwitchStatus = false;

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
                        Image.asset('assets/images/camera.png'),
                        SizedBox(width: 8),
                        Text(
                          'تصویر آویز',
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
                    DottedBorder(
                      color: grey300Color,
                      strokeWidth: 1.5,
                      dashPattern: [10, 5],
                      radius: Radius.circular(4),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'لطفا تصویر آویز خود را بارگذاری کنید',
                              style: TextStyle(
                                fontFamily: 'Shabnam',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: grey500Color,
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(AssetImage(
                                      'assets/images/document-upload.png')),
                                  SizedBox(width: 12),
                                  Text(
                                    'انتخاب تصویر',
                                    style: TextStyle(
                                      fontFamily: 'Shabnam',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(149, 40)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8)),
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/edit-2.png'),
                        SizedBox(width: 8),
                        Text(
                          'عنوان آویز',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: grey700Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'عنوان آویز را وارد کنید',
                        hintTextDirection: TextDirection.rtl,
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
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/clipboard-text.png'),
                        SizedBox(width: 8),
                        Text(
                          'توضیحات',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: grey700Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'توضیحات آویز را وارد کنید ...',
                        hintTextDirection: TextDirection.rtl,
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
                    SizedBox(height: 32),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: grey300Color)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            'فعال کردن گفتگو',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: grey700Color,
                            ),
                          ),
                          Switch(
                            value: chatSwitchStatus,
                            onChanged: (value) {
                              setState(() {
                                chatSwitchStatus = value;
                              });
                            },
                            activeColor: primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: grey300Color)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            'فعال کردن تماس',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: grey700Color,
                            ),
                          ),
                          Switch(
                            value: callSwitchStatus,
                            onChanged: (value) {
                              setState(() {
                                callSwitchStatus = value;
                              });
                            },
                            activeColor: primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'ثبت آگهی',
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
