import 'package:aviz/data/constants/colors.dart';
import 'package:flutter/material.dart';

class HorizontalAvizBox extends StatelessWidget {
  final String name;
  final String description;
  final String photoPath;
  final String price;
  final void Function()? onTap;

  const HorizontalAvizBox({
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
        padding: EdgeInsets.symmetric(vertical: 16),
        height: 139,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        this.name,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: grey700Color,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      this.description,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: grey500Color,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            'قیمت:',
                            textAlign: TextAlign.end,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontFamily: 'Shabnam',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: grey700Color,
                            ),
                          ),
                          Container(
                            color: grey100Color,
                            child: Text(
                              this.price,
                              style: TextStyle(
                                fontFamily: 'Shabnam',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Image(
                image: AssetImage(this.photoPath),
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
