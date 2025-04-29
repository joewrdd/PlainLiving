import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/device/device.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class RestraintGoalContainer extends StatelessWidget {
  const RestraintGoalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 116,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDark ? ConstantColors.black : ConstantColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.025),
              spreadRadius: 2,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'April Restraint Goal',
                    style: TextStyle(
                      color:
                          isDark ? ConstantColors.white : ConstantColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '\$3200 / \$10000',
                    style: TextStyle(
                      color:
                          isDark ? ConstantColors.white : ConstantColors.black,
                      fontSize: 14.5,
                    ),
                  ),
                ],
              ),

              // Progress Bar
              SizedBox(
                width: DeviceUtils.getScreenWidth(context),
                height: 8,
                child: LinearProgressIndicator(
                  value: 0.32,
                  backgroundColor:
                      isDark ? ConstantColors.darkGrey : ConstantColors.grey,
                  valueColor: AlwaysStoppedAnimation(
                    isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_outward,
                    color: const Color.fromARGB(255, 158, 158, 158),
                    size: 15,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    'You\'re \$6800 away from your goal. Keep it up!',
                    style: TextStyle(
                      color:
                          isDark ? ConstantColors.white : ConstantColors.black,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
