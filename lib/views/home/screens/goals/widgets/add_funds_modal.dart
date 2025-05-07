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
    final controller = Get.put(GoalsController());
    return Container(
      padding: EdgeInsets.only(
        top: ConstantSizes.defaultSpace / 2,
        left: ConstantSizes.defaultSpace / 1.8,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goalTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$1500 / \$10000',
                      style: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.white
                                : ConstantColors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                Text(
                  '0%',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
              child: Text(
                'Amount',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ConstantColors.darkGrey,
                ),
              ),
            ),
            TextField(
              controller: controller.targetAmountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ConstantSizes.defaultSpace,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ConstantSizes.borderRadiusSm,
                  ),
                  borderSide: BorderSide(
                    color: isDark ? ConstantColors.lGrey : ConstantColors.dGrey,
                  ),
                ),
                hintText: '0.00',
                hintStyle: TextStyle(
                  color: ConstantColors.darkGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 4.0),
                      // TODO: Switch Between + and -
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '\$',
                      style: TextStyle(
                        color: ConstantColors.darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwSections / 2),

            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
              child: Text(
                'Quick Select Amount',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ConstantColors.darkGrey,
                ),
              ),
            ),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  [500, 1000, 5000, 10000, 50000, 100000].map((amount) {
                    return InkWell(
                      onTap: () {
                        controller.targetAmountController.text =
                            amount.toString();
                      },
                      child: Container(
                        height: 39,
                        width: 125,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ConstantColors.darkGrey.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(
                            ConstantSizes.borderRadiusMd,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '\$$amount',
                            style: TextStyle(
                              color:
                                  isDark
                                      ? ConstantColors.white
                                      : ConstantColors.dark,
                            ),
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
                onPressed: () {},
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
                  'Confirm',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: ConstantSizes.spaceBtwSections * 2),
          ],
        ),
      ),
    );
  }
}
