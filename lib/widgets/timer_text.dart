import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class TimerText extends StatefulWidget {
  int seconds;
  
  TimerText({
    super.key,
    required this.seconds,
  });

  @override
  State<TimerText> createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Text(
      widget.seconds.toString(),
      style: TextStyle(
        fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
        fontSize: 18,
        color: grey700Color,
      ),
    );
  }

  void startTimer() {
    print('Started!');
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (widget.seconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            widget.seconds--;
          });
        }
      },
    );  
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
