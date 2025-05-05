import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/goals_controller.dart';

class AddFundsModal extends StatelessWidget {
  const AddFundsModal({
    super.key,
    required this.goalId,
    required this.goalTitle,
  });

  final String goalId;
  final String goalTitle;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.find<GoalsController>();
    final TextEditingController amountController = TextEditingController();

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

            Text(
              'Add Funds to "$goalTitle"',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Amount to Add (\$)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ConstantSizes.borderRadiusMd,
                  ),
                ),
              ),
              autofocus: true,
            ),
            const SizedBox(height: ConstantSizes.spaceBtwSections),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  [1000, 5000, 10000, 50000, 100000].map((amount) {
                    return InkWell(
                      onTap: () {
                        amountController.text = amount.toString();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isDark
                                  ? ConstantColors.darkContainer
                                  : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            ConstantSizes.borderRadiusMd,
                          ),
                        ),
                        child: Text(
                          '\$$amount',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (amountController.text.isNotEmpty) {
                    try {
                      final amount = int.parse(
                        amountController.text.replaceAll(',', ''),
                      );
                      controller.addFunds(goalId, amount);
                      Get.back();
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Invalid amount. Please enter a valid number.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter an amount',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
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
                  'Add Funds',
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
