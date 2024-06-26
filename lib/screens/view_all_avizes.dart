import 'package:aviz/data/constants/avizes.dart';
import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/screens/aviz_single_page_screen.dart';
import 'package:aviz/utils/numbers/number_extention.dart';
import 'package:flutter/material.dart';

class ViewAllAvizesScreen extends StatelessWidget {
  final String filter;

  const ViewAllAvizesScreen({
    super.key,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Image(image: AssetImage('assets/images/appbar-logo.png')),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: ImageIcon(AssetImage('assets/images/arrow-right.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      Text(
                        this.filter == 'hot' ? 'آویز های داغ' : 'آویز های اخیر',
                        style: mainTheme().textTheme.titleLarge,
                      ),
                      SizedBox(height: 24)
                    ],
                  ),
                ),
                SliverGrid.builder(
                  itemCount: all_avizes_list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 267,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AvizSinglePageScreen(
                                aviz: all_avizes_list[index])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
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
                                Expanded(
                                  child: Text(
                                    all_avizes_list[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: mainTheme().textTheme.titleLarge!.fontWeight,
                                      fontSize: 14,
                                      color: mainTheme().textTheme.titleLarge!.color,
                                    ),
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
                                      fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                                      fontSize: 12,
                                      color: mainTheme().textTheme.titleSmall!.color,
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
                                    fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                                    fontSize: 12,
                                    color: grey700Color,
                                  ),
                                ),
                                Container(
                                  color: grey100Color,
                                  child: Text(
                                    all_avizes_list[index].price.convertToPrice(),
                                    style: TextStyle(
                                      fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
