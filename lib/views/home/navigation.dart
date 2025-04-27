import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/goals/goals.dart';
import 'package:plainliving/views/home/screens/impulse/impulse.dart';
import 'package:plainliving/views/home/screens/profile/profile.dart';
import 'package:plainliving/views/home/screens/res/res.dart';
import 'package:plainliving/views/home/screens/stats/stats.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          isDark ? ConstantColors.dark : ConstantColors.lightContainer,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? ConstantColors.dark : ConstantColors.white,
        ),
        child: Obx(
          () => NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 11.5,
                  );
                }
                return TextStyle(color: Colors.grey, fontSize: 11.5);
              }),
            ),
            child: NavigationBar(
              height: 65,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) {
                controller.selectedIndex.value = index;
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(FontAwesomeIcons.house, color: Colors.grey),
                  label: 'Restraint',
                  selectedIcon: Icon(
                    FontAwesomeIcons.house,
                    color: isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(FontAwesomeIcons.creditCard, color: Colors.grey),
                  label: 'Goals',
                  selectedIcon: Icon(
                    FontAwesomeIcons.creditCard,
                    color: isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(FontAwesomeIcons.solidHand, color: Colors.grey),
                  label: 'Impulse',
                  selectedIcon: Icon(
                    FontAwesomeIcons.solidHand,
                    color: isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(FontAwesomeIcons.pieChart, color: Colors.grey),
                  label: 'Stats',
                  selectedIcon: Icon(
                    FontAwesomeIcons.pieChart,
                    color: isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(
                    FontAwesomeIcons.personCircleCheck,
                    color: Colors.grey,
                  ),
                  label: 'Profile',
                  selectedIcon: Icon(
                    FontAwesomeIcons.personCircleCheck,
                    color: isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const RestraintScreen(),
    const GoalsScreen(),
    const ImpulseScreen(),
    const StatsScreen(),
    const ProfileScreen(),
  ];
}
