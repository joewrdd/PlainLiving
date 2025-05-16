import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plainliving/common/widgets/layout/custom_info.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/all_imp/widgets/amount_change.dart';
import 'package:plainliving/views/home/screens/all_imp/widgets/category_change.dart';
import 'package:plainliving/views/home/screens/all_imp/widgets/product_change.dart';
import 'package:plainliving/views/home/screens/all_imp/widgets/purchase_date_change.dart';
import 'package:plainliving/views/home/screens/all_imp/widgets/reflection_change.dart';

class EditImpulseRecord extends StatelessWidget {
  const EditImpulseRecord({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          isDark ? ConstantColors.dark : ConstantColors.lightContainer,
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
          "All Records",
          style: TextStyle(
            fontSize: 18,
            color: isDark ? ConstantColors.white : ConstantColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        titleSpacing: 0,
        leadingWidth: 30,
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            icon: Icon(FontAwesomeIcons.trashCan, color: Colors.red, size: 21),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: ConstantSizes.defaultSpace / 1.8,
          right: ConstantSizes.defaultSpace / 1.8,
          top: ConstantSizes.defaultSpace * 1.2,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    isDark ? ConstantColors.darkerGrey : ConstantColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 1.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInformation(
                      title: 'Product Name:',
                      value: 'Weekly Coffee',
                      onTap: () => Get.to(() => const ChangeProductName()),
                    ),
                    CustomInformation(
                      title: 'Amount:',
                      value: '\$25.00',
                      onTap: () => Get.to(() => const ChangeAmount()),
                    ),
                    CustomInformation(
                      title: 'Category:',
                      value: 'Food',
                      onTap: () => Get.to(() => const ChangeCategory()),
                    ),
                    CustomInformation(
                      title: 'Purchase Date:',
                      value: '12/05/2024',
                      onTap: () => Get.to(() => const ChangePurchaseDate()),
                    ),
                    CustomInformation(
                      title: 'Reflection:',
                      value:
                          'I was feeling really good about myself and I wanted to treat myself to something nice.',
                      onTap: () => Get.to(() => const ChangeReflection()),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: ConstantSizes.spaceBtwInputFields * 2),
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
                  'Update',
                  style: TextStyle(
                    color: ConstantColors.white,
                    fontSize: 16,
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
