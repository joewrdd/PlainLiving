import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/utils/validators/validator.dart';

class ChangeResCategory extends StatelessWidget {
  const ChangeResCategory({super.key});

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
              'Select the new category for the record.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ConstantSizes.spaceBtwItems),

            Form(
              child: Column(
                children: [
                  TextFormField(
                    validator:
                        (value) =>
                            Validator.validateEmptyText('Category', value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: TextStyle(
                        color:
                            isDark
                                ? ConstantColors.dGrey
                                : ConstantColors.lGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
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
