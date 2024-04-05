import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:aviz/screens/auth_screen.dart';
import 'package:aviz/widgets/primary_button.dart';
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
      theme: ThemeData(
        fontFamily: appFontFamily,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final pages = List.generate(
    3,
    (index) => Column(
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
              style: mainTheme().textTheme.titleLarge,
            ),
            Image(image: AssetImage('assets/images/logo.png')),
            Text(
              "آگهی شماست ",
              style: mainTheme().textTheme.titleLarge,
            )
          ],
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
            style: mainTheme().textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return pages[index % pages.length];
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
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
                PrimaryButton(
                  text: 'ثبت نام',
                  fixedSize: MaterialStateProperty.all(Size(159, 40)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AuthScreen(type: 'register'),
                      ),
                    );
                  },
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
                      fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                      fontSize: mainTheme().textTheme.titleMedium!.fontSize,
                      color: primaryColor,
                    ),
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
