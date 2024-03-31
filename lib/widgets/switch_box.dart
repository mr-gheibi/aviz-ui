import 'package:aviz/data/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchBox extends StatefulWidget {
  final String data;
  bool value;
  final void Function(bool)? onChanged;

  SwitchBox({
    super.key,
    required this.data,
    required this.value,
    this.onChanged,
  });

  @override
  State<SwitchBox> createState() => _SwitchBoxState();
}

class _SwitchBoxState extends State<SwitchBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.value = !widget.value;
        if(widget.onChanged != null){
          widget.onChanged!(widget.value);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: grey300Color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              widget.data,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: grey700Color,
              ),
            ),
            Switch(
              inactiveTrackColor: grey400Color,
              activeTrackColor: primaryColor,
              inactiveThumbColor: Colors.white,
              trackOutlineColor: MaterialStatePropertyAll(Colors.transparent),
              value: widget.value,
              onChanged: (value) {
                widget.value = value;
                if(widget.onChanged != null){
                  widget.onChanged!(value);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
