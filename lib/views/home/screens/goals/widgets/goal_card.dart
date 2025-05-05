import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/goals_controller.dart';
import 'package:plainliving/views/home/screens/goals/widgets/add_funds_modal.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.id,
    required this.title,
    required this.currentAmount,
    required this.targetAmount,
    required this.targetDate,
  });

  final String id;
  final String title;
  final int currentAmount;
  final int targetAmount;
  final DateTime targetDate;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final today = DateTime.now();
    final difference = targetDate.difference(today).inDays;
    final progress = currentAmount / targetAmount;
    final progressPercent = (progress * 100).toInt();
    return Container(
      decoration: BoxDecoration(
        color: isDark ? ConstantColors.darkContainer : Colors.white,
        borderRadius: BorderRadius.circular(ConstantSizes.borderRadiusLg),
        border: Border.all(
          color: isDark ? Colors.transparent : Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 1.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuTheme(
                      data: PopupMenuThemeData(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        color:
                            isDark
                                ? ConstantColors.black
                                : ConstantColors.white,
                      ),
                      child: PopupMenuButton(
                        padding: EdgeInsets.only(
                          left: ConstantSizes.defaultSpace,
                        ),
                        icon: const Icon(Iconsax.more_circle, size: 24),
                        onSelected: (value) {
                          if (value == 'delete') {
                            Get.dialog(
                              CupertinoAlertDialog(
                                title: const Text('Delete Goal'),
                                content: Text(
                                  'Are you sure you want to delete "$title"?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color:
                                            isDark
                                                ? ConstantColors.white
                                                : ConstantColors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final controller = Get.put(
                                        GoalsController(),
                                      );
                                      controller.deleteGoal(id);
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (value == 'edit') {
                            // TODO: Edit Goal
                          } else {
                            // TODO: View Deposit History
                          }
                        },
                        itemBuilder:
                            (context) => [
                              PopupMenuItem(
                                value: 'edit',
                                height: 35,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.pencil,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Edit Goal',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'history',
                                height: 35,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.businessTime,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'View Deposit History',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                height: 35,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.trashCan,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Delete Goal',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Text(
                      '\$${NumberFormat("#,###").format(currentAmount)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      ' / \$${NumberFormat("#,###").format(targetAmount)}',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isDark
                                ? Colors.white.withOpacity(0.7)
                                : Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$progressPercent%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor:
                        isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isDark ? Colors.white : Colors.black,
                    ),
                    minHeight: 8,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: isDark ? Colors.grey : Colors.grey.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('MMM dd, yyyy').format(targetDate),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: isDark ? Colors.grey : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      difference < 0
                          ? 'Expired'
                          : (difference == 0
                              ? 'Today'
                              : '$difference days remaining'),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            difference < 0
                                ? Colors.red
                                : (isDark ? Colors.white : Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                showDragHandle: false,
                backgroundColor: Colors.transparent,
                builder:
                    (context) => AddFundsModal(goalId: id, goalTitle: title),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(ConstantSizes.borderRadiusLg),
                  bottomRight: Radius.circular(ConstantSizes.borderRadiusLg),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Add Funds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
