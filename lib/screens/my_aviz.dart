import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:flutter/material.dart';

class MyAvizScreen extends StatelessWidget {
  const MyAvizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/images/myaviz-logo.png')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      cursorColor: grey400Color,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        suffixIcon: ImageIcon(
                          AssetImage('assets/images/bnb-search.png'),
                          color: grey400Color,
                        ),
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'جستجو...',
                        hintStyle: mainTheme().textTheme.titleMedium,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: grey300Color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: grey300Color,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/profile.png'),
                        SizedBox(width: 8),
                        Text(
                          'حساب کاربری',
                          textAlign: TextAlign.end,
                          style: mainTheme().textTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Container(
                      height: 95,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: grey300Color, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/user-profile.png'),
                          Column(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'سید محمد جواد هاشمی',
                                style: TextStyle(
                                  fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                                  fontSize: mainTheme().textTheme.titleSmall!.fontSize,
                                  color: grey700Color,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    '۰۹۱۱۷۵۴۰۱۴۵',
                                    style: TextStyle(
                                      fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                                      fontSize: mainTheme().textTheme.titleSmall!.fontSize,
                                      color: grey700Color,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'تایید شده',
                                      style: TextStyle(
                                        fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 16),
                              Image.asset('assets/images/edit.png'),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Divider(color: grey300Color, thickness: 1),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var items = [
                      ['آگهی های من', 'note-2'],
                      ['پرداخت های من', 'card'],
                      ['بازدید های اخیر', 'eye'],
                      ['ذخیره شده ها', 'save-2'],
                      ['تنظیمات', 'setting'],
                      ['پشتیبانی و قوانین', 'message-question'],
                      ['درباره آویز', 'info-circle'],
                    ];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: grey300Color)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.rtl,
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Image.asset(
                                      'assets/images/${items[index][1]}.png'),
                                  SizedBox(width: 12),
                                  Text(
                                    items[index][0],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                                      fontSize: mainTheme().textTheme.titleMedium!.fontSize,
                                      color: grey700Color,
                                    ),
                                  ),
                                ],
                              ),
                              ImageIcon(
                                AssetImage('assets/images/arrow-left.png'),
                                color: grey400Color,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 7,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Column(
                      children: [
                        Text(
                          'نسخه',
                          style: TextStyle(
                            fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                            fontSize: mainTheme().textTheme.titleSmall!.fontSize,
                            color: grey400Color,
                          ),
                        ),
                        Text(
                          '1.5.9',
                          style: TextStyle(
                            fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                            fontSize: mainTheme().textTheme.titleSmall!.fontSize,
                            color: grey400Color,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
