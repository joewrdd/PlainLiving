import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plainliving/views/home/controllers/category_controller.dart';

class GoalsController extends GetxController {
  static GoalsController get instance => Get.find();

  final RxList<Map<String, dynamic>> goals = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> depositHistory =
      <Map<String, dynamic>>[].obs;
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
        'category': 'General',
      },
      {
        'id': '2',
        'title': 'Emergency Fund',
        'currentAmount': 500000,
        'targetAmount': 1000000,
        'targetDate': DateTime(2024, 12, 31),
        'isActive': true,
        'category': 'General',
      },
    ]);

    depositHistory.addAll([
      {
        'id': '1',
        'goalId': '1',
        'amount': 500,
        'date': DateTime.now().subtract(const Duration(days: 2)),
        'type': 'deposit',
      },
      {
        'id': '2',
        'goalId': '1',
        'amount': 1000,
        'date': DateTime.now().subtract(const Duration(days: 7)),
        'type': 'deposit',
      },
      {
        'id': '3',
        'goalId': '2',
        'amount': 300000,
        'date': DateTime.now().subtract(const Duration(days: 15)),
        'type': 'deposit',
      },
      {
        'id': '4',
        'goalId': '2',
        'amount': 200000,
        'date': DateTime.now().subtract(const Duration(days: 30)),
        'type': 'deposit',
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
      final categoryController = Get.find<CategoryController>();
      final selectedCategory = categoryController.selectedCategory;

      goals.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'title': titleController.text,
        'currentAmount': 0,
        'targetAmount': amount,
        'targetDate': targetDate.value,
        'isActive': true,
        'category': selectedCategory.name,
        'categoryIcon': selectedCategory.icon,
        'categoryColor': selectedCategory.color,
      });

      titleController.clear();
      targetAmountController.clear();
      targetDate.value = DateTime.now().add(const Duration(days: 365));
      categoryController.resetSelection();

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

      final depositId = DateTime.now().millisecondsSinceEpoch.toString();
      depositHistory.add({
        'id': depositId,
        'goalId': goalId,
        'amount': amount,
        'date': DateTime.now(),
        'type': 'deposit',
      });

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

  List<Map<String, dynamic>> getDepositHistoryForGoal(String goalId) {
    return depositHistory
        .where((deposit) => deposit['goalId'] == goalId)
        .toList()
      ..sort(
        (a, b) => (b['date'] as DateTime).compareTo(a['date'] as DateTime),
      );
  }

  Map<String, dynamic>? getGoalById(String goalId) {
    try {
      return goals.firstWhere((goal) => goal['id'] == goalId);
    } catch (e) {
      return null;
    }
  }

  void deleteGoal(String goalId) {
    goals.removeWhere((goal) => goal['id'] == goalId);
    // Also remove all deposit history for this goal
    depositHistory.removeWhere((deposit) => deposit['goalId'] == goalId);
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
