import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String type;
  final void Function(String) onFinish;

  const CategoryPage({
    super.key,
    required this.type,
    required this.onFinish,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
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
                widget.onFinish(_getListItems()[index]);
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
                        fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
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
    if (widget.type == 'cat') {
      return categories;
    } else if (widget.type == 'subcat') {
      return subCategories;
    } else {
      return [];
    }
  }
}
