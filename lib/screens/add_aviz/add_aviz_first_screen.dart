import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/screens/add_aviz/add_aviz_second_form_screen.dart';
import 'package:flutter/material.dart';

class AddAvizScreen extends StatefulWidget {
  const AddAvizScreen({super.key});

  @override
  State<AddAvizScreen> createState() => _AddAvizScreenState();
}

class _AddAvizScreenState extends State<AddAvizScreen> {
  int step = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      step = 1;
    });
  }

  var categories = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز',
  ];
  var subCategories = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Divider(
                color: primaryColor,
                thickness: 4,
                indent: 350 - ((step - 1) * 50),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: _getCategoriesListSliver(),
        ),
      ],
    );
  }

  Widget _getCategoriesListSliver() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                if (step == 1)
                  setState(() {
                    step = 2;
                  });
                else if (step == 2) {
                  setState(() {
                    step = 3;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddAvizFormScreen()));
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration:
                    BoxDecoration(border: Border.all(color: grey300Color)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      _getListItems()[index],
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: grey700Color,
                      ),
                    ),
                    ImageIcon(
                      AssetImage('assets/images/arrow-left.png'),
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        childCount: _getListItems().length,
      ),
    );
  }

  List _getListItems() {
    if (step == 1) {
      return categories;
    } else {
      return subCategories;
    }
  }
}
