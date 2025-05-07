import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:plainliving/common/widgets/shapes/rounded_image.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/images.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/device/device.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/goals_controller.dart';

class EditGoalModal extends StatelessWidget {
  const EditGoalModal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(GoalsController());
    final scrollController = ScrollController();
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: BoxDecoration(
        color: isDark ? ConstantColors.dark : ConstantColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstantSizes.borderRadiusLg),
          topRight: Radius.circular(ConstantSizes.borderRadiusLg),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 6,
          left: 6,
          right: 6,
          bottom: ConstantSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color:
                          isDark ? ConstantColors.white : ConstantColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Edit Saving Goal',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: ConstantSizes.spaceBtwItems / 2),

            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        width: 450,
                        decoration: BoxDecoration(
                          color: ConstantColors.white,
                          borderRadius: BorderRadius.circular(
                            ConstantSizes.borderRadiusMd,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ConstantColors.grey.withOpacity(0.2),
                              blurRadius: 3,
                              offset: Offset(2, 2.5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: ConstantSizes.defaultSpace,
                            right: ConstantSizes.defaultSpace,
                            top: ConstantSizes.defaultSpace / 2,
                            bottom: ConstantSizes.defaultSpace / 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundedImage(
                                image: ConstantImages.car,
                                width: 60,
                                height: 60,
                              ),
                              const SizedBox(
                                height: ConstantSizes.spaceBtwItems / 2,
                              ),
                              Text(
                                'Current Progress',
                                style: TextStyle(
                                  color:
                                      isDark
                                          ? ConstantColors.white
                                          : ConstantColors.dark,
                                  fontSize: 12.25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: ConstantSizes.spaceBtwItems / 2,
                              ),
                              Text(
                                '0%',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(
                                height: ConstantSizes.spaceBtwItems / 4,
                              ),
                              Text(
                                '\$1000 / \$10000',
                                style: TextStyle(
                                  color:
                                      isDark
                                          ? ConstantColors.white
                                          : ConstantColors.dark,
                                  fontSize: 12.25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: ConstantSizes.spaceBtwItems,
                              ),
                              SizedBox(
                                width: DeviceUtils.getScreenWidth(context),
                                height: 8,
                                child: LinearProgressIndicator(
                                  value: 0.32,
                                  backgroundColor:
                                      isDark
                                          ? ConstantColors.darkGrey
                                          : ConstantColors.grey,
                                  valueColor: AlwaysStoppedAnimation(
                                    isDark
                                        ? ConstantColors.white
                                        : ConstantColors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: ConstantSizes.spaceBtwItems),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                        child: Text(
                          'Goal Name',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.darkerGrey,
                          ),
                        ),
                      ),
                      TextField(
                        controller: controller.titleController,
                        decoration: InputDecoration(
                          hintText: 'Enter goal name',
                          hintStyle: TextStyle(
                            color: ConstantColors.darkGrey,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              ConstantSizes.borderRadiusSm,
                            ),
                            borderSide: BorderSide(
                              color:
                                  isDark
                                      ? ConstantColors.lGrey
                                      : ConstantColors.dGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: ConstantSizes.spaceBtwItems),

                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                        child: Text(
                          'Target Amount',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.darkerGrey,
                          ),
                        ),
                      ),
                      TextField(
                        controller: controller.targetAmountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 0,
                            ),
                            child: Icon(
                              Icons.monetization_on_outlined,
                              color: ConstantColors.darkGrey,
                              size: 20,
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 25,
                            minHeight: 45,
                          ),
                          hintText: 'Enter target amount',
                          hintStyle: TextStyle(
                            color: ConstantColors.darkGrey,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              ConstantSizes.borderRadiusSm,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: ConstantSizes.spaceBtwItems),

                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                        child: Text(
                          'Quick Select Amount',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.darkerGrey,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            [500, 1000, 5000, 10000, 50000, 100000].map((
                              amount,
                            ) {
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
                                      color: ConstantColors.darkGrey
                                          .withOpacity(0.4),
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
                      const SizedBox(height: ConstantSizes.spaceBtwItems),

                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                        child: Text(
                          'Set Deadline',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.darkerGrey,
                          ),
                        ),
                      ),
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
                                              primary: ConstantColors.black,
                                              onPrimary: ConstantColors.white,
                                              onSurface: ConstantColors.white,
                                            )
                                            : ColorScheme.light(
                                              primary: ConstantColors.black,
                                              onPrimary: ConstantColors.white,
                                              onSurface: ConstantColors.black,
                                            ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            isDark
                                                ? Colors.white
                                                : Colors.black,
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
                                    isDark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade400,
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
                                    color:
                                        isDark ? Colors.white : Colors.black87,
                                  ),
                                ),
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: 18,
                                  color:
                                      isDark
                                          ? Colors.grey
                                          : Colors.grey.shade700,
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
                            'Save Changes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: ConstantSizes.defaultSpace),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
