import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/res/widgets/related_records.dart';
import 'package:plainliving/views/home/screens/res/widgets/restraint_goal_details.dart';

class RestraintGoalModalSheet extends StatelessWidget {
  const RestraintGoalModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: BoxDecoration(
        color: isDark ? ConstantColors.dark : ConstantColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstantSizes.borderRadiusLg),
          topRight: Radius.circular(ConstantSizes.borderRadiusLg),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: ConstantSizes.defaultSpace / 1.5,
          left: 12,
          right: 12,
          bottom: ConstantSizes.defaultSpace,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'Restraint Goal Details',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: ConstantSizes.spaceBtwItems * 2),
            RestraintGoalDetails(),
            SizedBox(height: ConstantSizes.spaceBtwSections),
            RelatedRecords(),
          ],
        ),
      ),
    );
  }
}
