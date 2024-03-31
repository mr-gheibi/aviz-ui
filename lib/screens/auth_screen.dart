import 'package:aviz/screens/otp_screen.dart';
import 'package:aviz/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../data/constants/colors.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  String type = '';
  AuthScreen({super.key, required String type}) {
    this.type = type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: type == 'register'
                ? _getRegisterScreen(context)
                : _getLoginScreen(context)),
      ),
    );
  }

  Widget _getRegisterScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 56),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              " خوش اومدی به",
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: grey700Color,
              ),
            ),
            Image(image: AssetImage('assets/images/logo.png')),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'این فوق العادست که آویزو برای آگهی هات انتخاب کردی!',
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: grey500Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          cursorColor: grey400Color,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            hintText: 'نام و نام خانوادگی',
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
        SizedBox(height: 24),
        TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          cursorColor: grey400Color,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            hintText: 'شماره موبایل',
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
        Spacer(),
        PrimaryButton(
          text: 'مرحله بعد',
          fixedSize: MaterialStateProperty.all(Size(343, 40)),
          trailing: Image(image: AssetImage('assets/images/arrow-left.png')),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OTPScreen(type: 'register'),
              ),
            );
          },
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'قبلا ثبت نام کردی؟',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: grey500Color,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
                  fontSize: 14,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _getLoginScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 56),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              " ورود به",
              style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: grey700Color),
            ),
            Image(image: AssetImage('assets/images/logo.png')),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!',
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: grey500Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          cursorColor: grey400Color,
          decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              hintText: 'شماره موبایل',
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
              fillColor: Colors.grey[100]),
        ),
        Spacer(),
        PrimaryButton(
          text: 'مرحله بعد',
          fixedSize: MaterialStateProperty.all(Size(343, 40)),
          trailing: Image(image: AssetImage('assets/images/arrow-left.png')),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OTPScreen(type: 'login'),
              ),
            );
          },
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'تاحالا ثبت نام نکردی؟',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: grey500Color,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
                  fontSize: 14,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
