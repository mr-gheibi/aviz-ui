import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 56),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(image: AssetImage('assets/images/mainpage_lines.png')),
                Image(image: AssetImage('assets/images/mainpage_pic.png')),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  " اینجا محل",
                  style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: grey700Color),
                ),
                Image(image: AssetImage('assets/images/logo.png')),
                Text(
                  "آگهی شماست ",
                  style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: grey700Color),
                )
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: grey500Color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            AnimatedSmoothIndicator(
              activeIndex: 0,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: primaryColor,
                dotColor: grey300Color,
                dotHeight: 6,
                dotWidth: 6,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              textDirection: TextDirection.rtl,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AuthScreen(type: 'register'),
                      ),
                    );
                  },
                  child: Text(
                    'ثبت نام',
                    style: TextStyle(
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(159, 40)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AuthScreen(type: 'login'),
                      ),
                    );
                  },
                  child: Text(
                    'ورود',
                    style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: primaryColor),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(159, 40)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: primaryColor, width: 1)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 22)
          ],
        ),
      ),
    );
  }
}
