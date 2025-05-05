import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalsController extends GetxController {
  static GoalsController get instance => Get.find();

  final RxList<Map<String, dynamic>> goals = <Map<String, dynamic>>[].obs;
  final Rx<int> selectedFilterIndex = 0.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController targetAmountController = TextEditingController();
  final Rx<DateTime> targetDate =
      DateTime.now().add(const Duration(days: 365)).obs;

  @override
  void onInit() {
    super.onInit();
    //----- Load Sample Goals , Usually From DB -----
    goals.addAll([
      {
        'id': '1',
        'title': 'Financial Freedom',
        'currentAmount': 1500,
        'targetAmount': 5000000,
        'targetDate': DateTime(2026, 5, 17),
        'isActive': true,
      },
      {
        'id': '2',
        'title': 'Emergency Fund',
        'currentAmount': 500000,
        'targetAmount': 1000000,
        'targetDate': DateTime(2024, 12, 31),
        'isActive': true,
      },
    ]);
  }

  @override
  void onClose() {
    titleController.dispose();
    targetAmountController.dispose();
    super.onClose();
  }

  void addGoal() {
    if (titleController.text.isEmpty || targetAmountController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final amount = int.parse(targetAmountController.text.replaceAll(',', ''));

      goals.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'title': titleController.text,
        'currentAmount': 0,
        'targetAmount': amount,
        'targetDate': targetDate.value,
        'isActive': true,
      });

      titleController.clear();
      targetAmountController.clear();
      targetDate.value = DateTime.now().add(const Duration(days: 365));

      Get.back();

      Get.snackbar(
        'Success',
        'Goal created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Invalid amount. Please enter a valid number.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void addFunds(String goalId, int amount) {
    final index = goals.indexWhere((goal) => goal['id'] == goalId);
    if (index != -1) {
      final goal = goals[index];
      final newAmount = goal['currentAmount'] + amount;

      final bool willComplete = newAmount >= goal['targetAmount'];

      goals[index] = {
        ...goal,
        'currentAmount': newAmount,
        'isActive': !willComplete,
      };

      if (willComplete) {
        Get.snackbar(
          'Congratulations!',
          'You have completed your "${goal['title']}" goal!',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }

  void deleteGoal(String goalId) {
    goals.removeWhere((goal) => goal['id'] == goalId);
  }

  List<Map<String, dynamic>> getFilteredGoals() {
    final today = DateTime.now();

    switch (selectedFilterIndex.value) {
      case 1:
        return goals
            .where(
              (goal) =>
                  goal['isActive'] == true && goal['targetDate'].isAfter(today),
            )
            .toList();
      case 2:
        return goals
            .where((goal) => goal['currentAmount'] >= goal['targetAmount'])
            .toList();
      case 3:
        return goals
            .where(
              (goal) =>
                  goal['targetDate'].isBefore(today) &&
                  goal['currentAmount'] < goal['targetAmount'],
            )
            .toList();
      default:
        return goals;
    }
  }
}
