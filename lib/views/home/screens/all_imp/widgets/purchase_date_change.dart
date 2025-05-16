import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class ChangePurchaseDate extends StatelessWidget {
  const ChangePurchaseDate({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: isDark ? ConstantColors.white : ConstantColors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Edit Record",
          style: TextStyle(
            fontSize: 18,
            color: isDark ? ConstantColors.white : ConstantColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        titleSpacing: 0,
        leadingWidth: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the new purchase date for the record.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            InkWell(
              onTap: () async {
                final DateTime? _ = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
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
                                isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        dialogBackgroundColor:
                            isDark ? ConstantColors.dark : ConstantColors.white,
                      ),
                      child: child!,
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: ConstantSizes.defaultSpace / 2,
                  vertical: ConstantSizes.defaultSpace / 1.5,
                ),
                decoration: BoxDecoration(
                  color:
                      isDark
                          ? ConstantColors.bgTextField
                          : ConstantColors.lightContainer,
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),

                  borderRadius: BorderRadius.circular(
                    ConstantSizes.borderRadiusLg,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Target Date: ${DateFormat('MMM dd, yyyy').format(DateTime.now())}',
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
            const SizedBox(height: ConstantSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor:
                      isDark
                          ? ConstantColors.darkContainer
                          : ConstantColors.black,
                ),
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: ConstantColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
