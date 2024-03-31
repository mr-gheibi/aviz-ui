import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/screens/home_screen.dart';
import 'package:aviz/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String type = '';
  OTPScreen({super.key, required String type}) {
    this.type = type;
  }

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final CountdownController _countdownController =
      new CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: widget.type == 'register'
              ? _getRegisterOTPScreen(context)
              : _getLoginOTPScreen(context),
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
            Countdown(
              controller: _countdownController,
              seconds: 120,
              build: (BuildContext context, double time) {
                int mins = (time / 60).floor();
                int seconds = (time - (60 * (time / 60).floor())).toInt();
                return Text(
                  '$mins:$seconds',
                  style: TextStyle(
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: grey700Color,
                  ),
                );
              },
            ),
            SizedBox(width: 4),
            TextButton(
              onPressed: () {
                if (_countdownController.isCompleted!) {
                  _countdownController.restart();
                } else {
                  Fluttertoast.showToast(
                    msg: "لطفا تا انقضای کد ارسال شده قبلی صبر کنید.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: Text(
                'ارسال مجدد کد',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: grey400Color,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        PrimaryButton(
          text: 'تایید ورود',
          fixedSize: MaterialStateProperty.all(Size(343, 40)),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
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
            Countdown(
              controller: _countdownController,
              seconds: 120,
              build: (BuildContext context, double time) {
                int mins = (time / 60).floor();
                int seconds = (time - (60 * (time / 60).floor())).toInt();
                return Text(
                  '$mins:$seconds',
                  style: TextStyle(
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: grey400Color,
                  ),
                );
              },
            ),
            SizedBox(width: 4),
            TextButton(
              onPressed: () {
                if (_countdownController.isCompleted!) {
                  _countdownController.restart();
                } else {
                  Fluttertoast.showToast(
                    msg: "لطفا تا انقضای کد ارسال شده قبلی صبر کنید.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: Text(
                'ارسال مجدد کد',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: grey700Color,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        PrimaryButton(
          text: 'تایید ثبت نام',
          fixedSize: MaterialStateProperty.all(Size(343, 40)),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
