import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/goals_controller.dart';

class AddGoalModal extends StatelessWidget {
  AddGoalModal({super.key});

  final controller = Get.find<GoalsController>();

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.only(
        top: ConstantSizes.defaultSpace / 2,
        left: ConstantSizes.defaultSpace,
        right: ConstantSizes.defaultSpace,
        bottom:
            MediaQuery.of(context).viewInsets.bottom +
            ConstantSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: isDark ? ConstantColors.dark : ConstantColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstantSizes.borderRadiusLg),
          topRight: Radius.circular(ConstantSizes.borderRadiusLg),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),

            const Text(
              'Add New Savings Goal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: 'Goal Title',
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ConstantSizes.borderRadiusMd,
                  ),
                ),
              ),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            TextField(
              controller: controller.targetAmountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Target Amount (\$)',
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ConstantSizes.borderRadiusMd,
                  ),
                ),
              ),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            Obx(
              () => InkWell(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: controller.targetDate.value,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme:
                              isDark
                                  ? ColorScheme.dark(
                                    primary: Colors.black,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.white,
                                  )
                                  : ColorScheme.light(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    onSurface: Colors.white,
                                  ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          dialogBackgroundColor:
                              isDark
                                  ? ConstantColors.dark
                                  : ConstantColors.white,
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    controller.targetDate.value = pickedDate;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstantSizes.defaultSpace / 2,
                    vertical: ConstantSizes.defaultSpace / 1.5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isDark ? Colors.grey.shade700 : Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(
                      ConstantSizes.borderRadiusMd,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Target Date: ${DateFormat('MMM dd, yyyy').format(controller.targetDate.value)}',
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: isDark ? Colors.grey : Colors.grey.shade700,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.addGoal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      ConstantSizes.borderRadiusMd,
                    ),
                  ),
                ),
                child: const Text(
                  'Create Goal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: ConstantSizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}
