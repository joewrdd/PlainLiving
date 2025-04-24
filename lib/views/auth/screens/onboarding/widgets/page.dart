import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/images.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.point1,
    required this.point2,
    required this.point3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

  final String point1, point2, point3;
  final IconData icon1, icon2, icon3;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: ConstantSizes.defaultSpace,
        right: ConstantSizes.defaultSpace,
        top: ConstantSizes.defaultSpace * 5,
        bottom: ConstantSizes.defaultSpace * 2,
      ),
      child: Column(
        children: [
          Image.asset(
            isDark ? ConstantImages.onboarding1L : ConstantImages.onboarding1D,
            height: 120,
            width: 120,
          ),
          const SizedBox(height: ConstantSizes.spaceBtwItems / 1.5),
          Text(
            'PlainLiving',
            style: GoogleFonts.benne(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isDark ? ConstantColors.white : ConstantColors.black,
            ),
          ),
          Text(
            'Empowering Smarter Financial Moves',
            style: GoogleFonts.benne(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: ConstantColors.darkGrey,
            ),
          ),
          const SizedBox(height: ConstantSizes.spaceBtwSections * 2),

          Text(
            'Disciplined Budgeting',
            style: GoogleFonts.benne(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDark ? ConstantColors.white : ConstantColors.black,
            ),
          ),
          Text(
            'Financial Freedom',
            style: GoogleFonts.benne(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: ConstantColors.test1,
            ),
          ),
          const SizedBox(height: ConstantSizes.spaceBtwSections * 3),

          Padding(
            padding: const EdgeInsets.only(
              left: ConstantSizes.defaultSpace,
              right: ConstantSizes.defaultSpace,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(icon1, color: ConstantColors.test1),
                    const SizedBox(width: ConstantSizes.spaceBtwItems / 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        point1,
                        style: GoogleFonts.benne(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ConstantSizes.spaceBtwSections),
                Row(
                  children: [
                    Icon(icon2, color: ConstantColors.test1),
                    const SizedBox(width: ConstantSizes.spaceBtwItems / 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        point2,
                        style: GoogleFonts.benne(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ConstantSizes.spaceBtwSections),

                Row(
                  children: [
                    Icon(icon3, color: ConstantColors.test1),
                    const SizedBox(width: ConstantSizes.spaceBtwItems / 2),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        point3,
                        style: GoogleFonts.benne(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
