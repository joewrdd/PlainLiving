import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/common/widgets/stack/circular_icon.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/device/device.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/res/widgets/recordrs_modalsheet.dart';

class RestraintGoalDetails extends StatelessWidget {
  const RestraintGoalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isDark ? ConstantColors.black : ConstantColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: ConstantSizes.defaultSpace / 1.5,
          left: ConstantSizes.defaultSpace / 1.8,
          right: ConstantSizes.defaultSpace / 1.8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'April Restraint Goal',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomCircularIcon(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: false,
                          backgroundColor:
                              isDark
                                  ? ConstantColors.dark
                                  : ConstantColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          builder: (context) => RecordRSModalSheet(),
                        );
                      },
                      icon: FontAwesomeIcons.plus,
                      radius: 50,
                      width: 38,
                      height: 38,
                    ),
                    SizedBox(width: ConstantSizes.spaceBtwItems / 2),
                    CustomCircularIcon(
                      icon: FontAwesomeIcons.pencil,
                      radius: 50,
                      width: 38,
                      height: 38,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: ConstantSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Target Amount',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '\$10000',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(width: ConstantSizes.spaceBtwSections),
                Column(
                  children: [
                    Text(
                      'Saved Amount',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '\$0',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(width: ConstantSizes.spaceBtwSections),
                Column(
                  children: [
                    Text(
                      'Completion Rate',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '0%',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: ConstantSizes.spaceBtwSections + 5),
            Column(
              children: [
                SizedBox(
                  width: DeviceUtils.getScreenWidth(context),
                  height: 8,
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor:
                        isDark ? ConstantColors.darkGrey : ConstantColors.grey,
                    valueColor: AlwaysStoppedAnimation(
                      isDark ? ConstantColors.white : ConstantColors.black,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$5000 remaining',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '15 days persisted',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
