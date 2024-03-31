import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/widgets/switch_box.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class LastInfoPage extends StatefulWidget {
  final void Function() onFinish;

  const LastInfoPage({
    super.key,
    required this.onFinish,
  });

  @override
  State<LastInfoPage> createState() => _LastInfoPageState();
}

class _LastInfoPageState extends State<LastInfoPage> {
  bool chatSwitchStatus = false;
  bool callSwitchStatus = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
                              ImageIcon(
                                AssetImage('assets/images/document-upload.png'),
                                color: Colors.white,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'انتخاب تصویر',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(149, 40)),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(8)),
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
                  cursorColor: grey400Color,
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
                    focusedBorder: OutlineInputBorder(
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
                  cursorColor: grey400Color,
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
                    focusedBorder: OutlineInputBorder(
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
                SwitchBox(
                  data: 'فعال کردن گفتگو',
                  value: chatSwitchStatus,
                  onChanged: (value) {
                    setState(() {
                      chatSwitchStatus = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                SwitchBox(
                  data: 'فعال کردن تماس',
                  value: callSwitchStatus,
                  onChanged: (value) {
                    setState(() {
                      callSwitchStatus = value;
                    });
                  },
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: widget.onFinish,
                  child: Text(
                    'ثبت آگهی',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(343, 40)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
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
    );
  }
}
