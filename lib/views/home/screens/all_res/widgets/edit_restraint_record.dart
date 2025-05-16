import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plainliving/common/widgets/layout/custom_info.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/all_res/widgets/product_change_res.dart';
import 'package:plainliving/views/home/screens/all_res/widgets/price_change.dart';
import 'package:plainliving/views/home/screens/all_res/widgets/creation_date.dart';
import 'package:plainliving/views/home/screens/all_res/widgets/why_not_buy_change.dart';
import 'package:plainliving/views/home/screens/all_res/widgets/category_change_res.dart';

class EditRestraintRecord extends StatelessWidget {
  const EditRestraintRecord({super.key});

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
                      title: 'What to buy?',
                      value: 'Gaming PC',
                      onTap: () => Get.to(() => const ChangeResName()),
                    ),
                    CustomInformation(
                      title: 'Price:',
                      value: '\$1125.00',
                      onTap: () => Get.to(() => const ChangeResPrice()),
                    ),
                    CustomInformation(
                      title: 'Category:',
                      value: 'Electronics',
                      onTap: () => Get.to(() => const ChangeResCategory()),
                    ),
                    CustomInformation(
                      title: 'Creation Date:',
                      value: '14/05/2024',
                      onTap: () => Get.to(() => const ChangeCreationDate()),
                    ),
                    CustomInformation(
                      title: 'Why not buy it?',
                      value: 'Too expensive, I can\'t afford it.',
                      onTap: () => Get.to(() => const ChangeWhyNotBuy()),
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
