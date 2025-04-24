import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/device/device.dart';
import 'package:plainliving/views/auth/controllers/onboarding/onboarding_controller.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
      left: ConstantSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 2,
        onDotClicked: controller.dotNavigation,
        effect: SwapEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: ConstantColors.softGrey,
          activeDotColor: isDark ? ConstantColors.white : ConstantColors.black,
        ),
      ),
    );
  }
}
