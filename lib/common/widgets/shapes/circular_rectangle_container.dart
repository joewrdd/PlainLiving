import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';

class CircularRectangleContainer extends StatelessWidget {
  const CircularRectangleContainer({
    super.key,
    required this.title,
    required this.amount,
    required this.colors,
  });

  final String title;
  final String amount;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(ConstantSizes.borderRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
                color: ConstantColors.white,
              ),
            ),
            Text(
              amount,
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ConstantColors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
