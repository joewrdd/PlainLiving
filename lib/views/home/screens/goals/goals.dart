import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/goals_controller.dart';
import 'package:plainliving/views/home/controllers/scroll_controller.dart';
import 'package:plainliving/views/home/screens/goals/widgets/add_goal_modal.dart';
import 'package:plainliving/views/home/screens/goals/widgets/goal_card.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final scrollController = Get.put(AppScrollController());
    final controller = Get.put(GoalsController());
    return Scaffold(
      backgroundColor:
          isDark ? ConstantColors.dark : ConstantColors.lightContainer,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstantSizes.defaultSpace / 1.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: ConstantSizes.defaultSpace + 40),
                      const Text(
                        'Savings Goals',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: ConstantSizes.defaultSpace / 2),

                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final labels = [
                              'All',
                              'Active',
                              'Completed',
                              'Expired',
                            ];
                            return Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.selectedFilterIndex.value =
                                        index;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          controller
                                                      .selectedFilterIndex
                                                      .value ==
                                                  index
                                              ? Colors.black
                                              : (isDark
                                                  ? ConstantColors.darkContainer
                                                  : Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            isDark
                                                ? Colors.transparent
                                                : Colors.grey.withOpacity(0.4),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        labels[index],
                                        style: TextStyle(
                                          color:
                                              controller
                                                          .selectedFilterIndex
                                                          .value ==
                                                      index
                                                  ? Colors.white
                                                  : (isDark
                                                      ? Colors.white
                                                      : Colors.black),
                                          fontWeight:
                                              controller
                                                          .selectedFilterIndex
                                                          .value ==
                                                      index
                                                  ? FontWeight.w500
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: ConstantSizes.defaultSpace),
                    ],
                  ),
                ),

                Expanded(
                  child: Obx(() {
                    final filteredGoals = controller.getFilteredGoals();

                    if (filteredGoals.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.piggyBank,
                              size: 50,
                              color:
                                  isDark
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade400,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No Goals Found',
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    isDark
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tap + to create a new goal',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    isDark
                                        ? Colors.grey.shade500
                                        : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      controller: scrollController.scrollController,
                      padding: const EdgeInsets.symmetric(
                        horizontal: ConstantSizes.defaultSpace / 1.5,
                      ),
                      itemCount: filteredGoals.length,
                      itemBuilder: (context, index) {
                        final goal = filteredGoals[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: ConstantSizes.defaultSpace,
                          ),
                          child: GoalCard(
                            id: goal['id'],
                            title: goal['title'],
                            currentAmount: goal['currentAmount'],
                            targetAmount: goal['targetAmount'],
                            targetDate: goal['targetDate'],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),

            Positioned(
              top: 16,
              right: 16,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: false,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => AddGoalModal(),
                    );
                  },
                  icon: const Icon(Icons.add, color: Colors.white, size: 23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
