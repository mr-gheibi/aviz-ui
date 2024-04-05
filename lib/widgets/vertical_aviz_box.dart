import 'package:aviz/data/constants/colors.dart';
import 'package:aviz/data/constants/theme.dart';
import 'package:flutter/material.dart';

class VerticalAvizBox extends StatelessWidget {
  final String name;
  final String description;
  final String photoPath;
  final String price;
  final void Function()? onTap;

  const VerticalAvizBox({
    super.key,
    required this.name,
    required this.description,
    required this.photoPath,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(16),
        width: 224,
        height: 267,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.02),
              offset: Offset.fromDirection(0, 4),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.02),
              offset: Offset.fromDirection(0, 18),
              blurRadius: 18,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.01),
              offset: Offset.fromDirection(0, 40),
              blurRadius: 24,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0),
              offset: Offset.fromDirection(0, 70),
              blurRadius: 28,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0),
              offset: Offset.fromDirection(0, 110),
              blurRadius: 31,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                image: AssetImage(
                  this.photoPath,
                ),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  this.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontWeight: mainTheme().textTheme.titleLarge!.fontWeight,
                    fontSize: 14,
                    color: mainTheme().textTheme.titleLarge!.color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    this.description,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: mainTheme().textTheme.titleSmall!.fontWeight,
                      fontSize: 12,
                      color: mainTheme().textTheme.titleSmall!.color,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'قیمت:',
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                    fontSize: 12,
                    color: grey700Color,
                  ),
                ),
                Container(
                  color: grey100Color,
                  child: Text(
                    this.price,
                    style: TextStyle(
                      fontWeight: mainTheme().textTheme.titleMedium!.fontWeight,
                      fontSize: 12,
                      color: primaryColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
