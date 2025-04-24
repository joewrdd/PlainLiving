import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plainliving/views/auth/controllers/onboarding/onboarding_controller.dart';
import 'package:plainliving/views/auth/screens/onboarding/widgets/dot_navigation.dart';
import 'package:plainliving/views/auth/screens/onboarding/widgets/next_btn.dart';
import 'package:plainliving/views/auth/screens/onboarding/widgets/page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndex,
            children: [
              OnBoardingPage(
                point1: 'Log every bit of savings',
                icon1: FontAwesomeIcons.circleArrowDown,
                point2: 'Define saving targets',
                icon2: FontAwesomeIcons.bullseye,
                point3: 'Watch savings grow',
                icon3: FontAwesomeIcons.chartSimple,
              ),
              OnBoardingPage(
                point1: 'Record unplanned expenses',
                icon1: FontAwesomeIcons.solidMoneyBill1,
                point2: 'Track spending patterns',
                icon2: FontAwesomeIcons.chartLine,
                point3: 'Stay on top of your finances',
                icon3: FontAwesomeIcons.solidAddressCard,
              ),
            ],
          ),
          const OnBoardingDotNavigation(),
          const OnBoardingNextBtn(),
        ],
      ),
    );
  }
}
