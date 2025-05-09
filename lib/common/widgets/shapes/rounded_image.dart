import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.image,
    this.width = 50,
    this.height = 50,
    this.backgroundColor,
    this.imageColor,
  });
  final String image;
  final double width, height;
  final Color? backgroundColor, imageColor;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              backgroundColor ??
              (isDark ? ConstantColors.white : ConstantColors.black),
        ),
        child: Center(
          child: Image.asset(
            image,
            width: width * 0.6,
            height: height * 0.6,
            color:
                imageColor ??
                (isDark ? ConstantColors.black : ConstantColors.white),
          ),
        ),
      ),
    );
  }
}
