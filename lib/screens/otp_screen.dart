import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  String type = '';
  OTPScreen({super.key, required String type}) {
    this.type = type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child:
              type == 'register' ? _getRegisterOTPScreen(context) : _getLoginOTPScreen(context),
        ),
      ),
    );
  }

  Widget _getLoginOTPScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 56),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'تایید شماره موبایل',
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                color: grey700Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'کد ورود پیامک شده را وارد کنید',
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w400,
                color: grey500Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        OtpTextField(
          numberOfFields: 4,
          fieldWidth: 73.75,
          cursorColor: grey700Color,
          margin: EdgeInsets.only(right: 16),
          borderColor: grey300Color,
          enabledBorderColor: grey300Color,
          focusedBorderColor: grey300Color,
          disabledBorderColor: grey300Color,
          filled: true,
          fillColor: grey300Color,
          showFieldAsBox: true,
          textStyle: TextStyle(
            fontFamily: 'Shabnam',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: grey700Color,
          ),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              '00:45',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: grey700Color,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'ارسال مجدد کد',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: grey400Color,
              ),
            ),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Text(
            'تایید ورود',
            style: TextStyle(
              fontFamily: 'Shabnam',
              fontWeight: FontWeight.w500,
              fontSize: 16,
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
        SizedBox(height: 32),
      ],
    );
  }

  Widget _getRegisterOTPScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 56),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'تایید شماره موبایل',
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                color: grey700Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'کد ثبت نام پیامک شده را وارد کنید',
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w400,
                color: grey500Color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        OtpTextField(
          numberOfFields: 4,
          fieldWidth: 73.75,
          cursorColor: grey700Color,
          margin: EdgeInsets.only(right: 16),
          borderColor: grey300Color,
          enabledBorderColor: grey300Color,
          focusedBorderColor: grey300Color,
          disabledBorderColor: grey300Color,
          filled: true,
          fillColor: grey300Color,
          showFieldAsBox: true,
          textStyle: TextStyle(
            fontFamily: 'Shabnam',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: grey700Color,
          ),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              '00:45',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: grey400Color,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'ارسال مجدد کد',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: grey700Color,
              ),
            ),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Text(
            'تایید ثبت نام',
            style: TextStyle(
              fontFamily: 'Shabnam',
              fontWeight: FontWeight.w500,
              fontSize: 16,
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
        SizedBox(height: 32),
      ],
    );
  }
}
