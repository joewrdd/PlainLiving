import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/device/device.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/auth/controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextBtn extends StatelessWidget {
  const OnBoardingNextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      right: ConstantSizes.defaultSpace,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.buttonCircular),
            ),
            backgroundColor:
                isDark ? ConstantColors.white : ConstantColors.black,
            foregroundColor:
                isDark ? ConstantColors.black : ConstantColors.white,
          ),
          child: Obx(
            () => Text(
              controller.currentPageIndex.value == 1 ? 'Get Started' : 'Next',
              style: TextStyle(
                fontSize: 12,
                color: isDark ? ConstantColors.black : ConstantColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
