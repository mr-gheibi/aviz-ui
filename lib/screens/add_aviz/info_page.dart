import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/widgets/number_text_field.dart';
import 'package:aviz/widgets/switch_box.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final String category;
  final String subCategory;
  final void Function() onFinish;

  const InfoPage({
    super.key,
    required this.category,
    required this.subCategory,
    required this.onFinish,
  });

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                _getSectionTitle(
                    'انتخاب دسته بندی آویز', 'assets/images/category.png'),
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
                            initialSelection: widget.subCategory,
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
                            textAlign: TextAlign.start,
                            cursorColor: grey400Color,
                            decoration: InputDecoration(
                              hintText: 'خیابان صیاد شیرازی',
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
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Divider(thickness: 1),
                SizedBox(height: 32),
                _getSectionTitle('ویژگی ها', 'assets/images/clipboard.png'),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    _getNumberTextFieldSection('متراژ'),
                    _getNumberTextFieldSection('تعداد اتاق'),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    _getNumberTextFieldSection('طبقه'),
                    _getNumberTextFieldSection('سال ساخت'),
                  ],
                ),
                SizedBox(height: 32),
                Divider(thickness: 1),
                SizedBox(height: 32),
                _getSectionTitle('امکانات', 'assets/images/magicpen.png'),
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

                      return SwitchBox(
                        data: e,
                        value: currentBool,
                        onChanged: (value) {
                          setState(() {
                            if (e == 'آسانسور')
                              hasElevator = !hasElevator;
                            else if (e == 'پارکینگ')
                              hasParking = !hasParking;
                            else if (e == 'انباری')
                              hasWarehouse = !hasWarehouse;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: widget.onFinish,
                  child: Text(
                    'بعدی',
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

  Widget _getSectionTitle(String title, String iconPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        Image.asset(iconPath),
        SizedBox(width: 8),
        Text(
          title,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontFamily: 'Shabnam',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: grey700Color,
          ),
        )
      ],
    );
  }

  Widget _getNumberTextFieldSection(String title) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
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
              max: 9999,
            ),
          ),
        ],
      ),
    );
  }
}
