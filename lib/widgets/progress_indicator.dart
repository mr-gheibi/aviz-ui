import 'package:aviz/data/constants/colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double progress;

  const ProgressIndicatorWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: primaryColor,
      thickness: 4,
      indent: MediaQuery.of(context).size.width * (100-progress) / 100,
    );
  }
}
