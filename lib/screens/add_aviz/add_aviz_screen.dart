import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/screens/add_aviz/category_page.dart';
import 'package:aviz/screens/add_aviz/info_page.dart';
import 'package:aviz/screens/add_aviz/last_info_page.dart';
import 'package:aviz/screens/add_aviz/location_page.dart';
import 'package:aviz/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class AddAvizScreen extends StatefulWidget {
  const AddAvizScreen({super.key});

  @override
  State<AddAvizScreen> createState() => _AddAvizScreenState();
}

class _AddAvizScreenState extends State<AddAvizScreen> {
  int step = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      step = 0;
    });
  }

  String chosenCategory = 'اجاره مسکونی';
  String chosenSubCategory = 'فروش آپارتمان';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(step > 0) {
          setState(() {
            step--;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                step < 2 ? 'دسته بندی' : 'ثبت',
                style: TextStyle(
                  fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                  fontSize: mainTheme().textTheme.titleMedium!.fontSize,
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
                if (step > 0) {
                  setState(() {
                    step--;
                  });
                }
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                step = 0;
              });
            },
          ),
          iconTheme: IconThemeData(color: Colors.black),
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 4),
            child: ProgressIndicatorWidget(progress: 5 + (step * 19)),
          ),
        ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: IndexedStack(
              index: step,
              key: UniqueKey(),
              children: [
                Visibility(
                  visible: step == 0,
                  child: CategoryPage(
                    type: 'cat',
                    onFinish: (value) {
                      setState(() {
                        chosenCategory = value;
                        step++;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: step == 1,
                  child: CategoryPage(
                    type: 'subcat',
                    onFinish: (value) {
                      setState(() {
                        chosenSubCategory = value;
                        step++;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: step == 2,
                  child: InfoPage(
                    category: chosenCategory,
                    subCategory: chosenSubCategory,
                    onFinish: () {
                      setState(() {
                        step++;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: step == 3,
                  child: LocationPage(
                    onFinish: () {
                      setState(() {
                        step++;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: step == 4,
                  child: LastInfoPage(
                    onFinish: () {
                      setState(() {
                        step++;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: step == 5,
                  child: _getFinalPage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getFinalPage() {
    return Center(
      child: Text(
        'آگهی شما ثبت شد.',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: mainTheme().textTheme.titleLarge!.fontWeight,
          fontSize: 40,
          color: mainTheme().textTheme.titleLarge!.color,
        ),
      ),
    );
  }
}
