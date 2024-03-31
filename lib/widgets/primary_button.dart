import 'package:aviz/data/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final MaterialStateProperty<Size?>? fixedSize;

  const PrimaryButton({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.fixedSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (this.onPressed != null) {
          this.onPressed!();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          this.leading != null ? this.leading! : SizedBox.shrink(),
          this.leading != null ? SizedBox(width: 12) : SizedBox.shrink(),
          Text(
            this.text,
            style: TextStyle(
              fontFamily: 'Shabnam',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          this.trailing != null ? SizedBox(width: 12) : SizedBox.shrink(),
          this.trailing != null ? this.trailing! : SizedBox.shrink(),
        ],
      ),
      style: ButtonStyle(
        fixedSize: this.fixedSize,
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
