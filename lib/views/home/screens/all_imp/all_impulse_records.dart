import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plainliving/common/widgets/shapes/circle_container.dart';
import 'package:plainliving/common/widgets/shapes/rounded_image.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/images.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/scroll_controller.dart';
import 'package:plainliving/common/widgets/action_sheets/custom_action_sheet.dart';

const List<String> _timeList = [
  'All',
  'This Month',
  'Last Month',
  'This Year',
  'Last Year',
];

class AllImpulseRecords extends StatelessWidget {
  const AllImpulseRecords({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final int allRecordsCount = 4;
    final controller = Get.put(AppScrollController());
    return Scaffold(
      backgroundColor:
          isDark ? ConstantColors.dark : ConstantColors.lightContainer,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 22,
                  color: isDark ? ConstantColors.white : ConstantColors.black,
                ),
              ),
              Text("Back", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        leadingWidth: 80,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: ConstantSizes.defaultSpace / 1.8,
              right: ConstantSizes.defaultSpace / 1.8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Records',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: ConstantSizes.spaceBtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      height: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            isDark
                                ? ConstantColors.darkContainer
                                : ConstantColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          ConstantSizes.defaultSpace / 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Impulse Purchases',
                              style: TextStyle(
                                color:
                                    isDark
                                        ? ConstantColors.white
                                        : ConstantColors.black,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              '\$1,490.00',
                              style: TextStyle(
                                color:
                                    isDark
                                        ? ConstantColors.white
                                        : ConstantColors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            isDark
                                ? ConstantColors.darkContainer
                                : ConstantColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          ConstantSizes.defaultSpace / 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Record Count',
                              style: TextStyle(
                                color:
                                    isDark
                                        ? ConstantColors.white
                                        : ConstantColors.black,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              '2 times',
                              style: TextStyle(
                                color:
                                    isDark
                                        ? ConstantColors.white
                                        : ConstantColors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ConstantSizes.spaceBtwItems),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: CustomDropdown<String>(
                        items: _timeList,
                        initialItem: _timeList[0],
                        onChanged: (value) {},
                        hintText: 'Select Time Period',
                        decoration: CustomDropdownDecoration(
                          closedFillColor:
                              isDark
                                  ? ConstantColors.dark.withOpacity(0.3)
                                  : ConstantColors.white.withOpacity(0.3),
                          expandedFillColor:
                              isDark
                                  ? ConstantColors.dark
                                  : ConstantColors.white,
                          hintStyle: TextStyle(
                            color:
                                isDark
                                    ? ConstantColors.white.withOpacity(0.7)
                                    : ConstantColors.black.withOpacity(0.7),
                          ),
                          headerStyle: TextStyle(
                            color:
                                isDark
                                    ? ConstantColors.white
                                    : ConstantColors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: ConstantSizes.spaceBtwItems),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search record...',
                          hintStyle: TextStyle(
                            color:
                                isDark
                                    ? ConstantColors.dGrey
                                    : ConstantColors.lGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: ConstantSizes.defaultSpace / 2,
                            vertical: ConstantSizes.defaultSpace / 2,
                          ),
                          prefixIcon: Icon(
                            FontAwesomeIcons.search,
                            size: 16,
                            color:
                                isDark
                                    ? ConstantColors.dGrey
                                    : ConstantColors.lGrey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ConstantSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color:
                      isDark ? ConstantColors.darkerGrey : ConstantColors.white,
                  boxShadow: [],
                ),
                child: ListView.builder(
                  controller: controller.scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: allRecordsCount,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder:
                                (BuildContext context) => CustomActionSheet(
                                  onEditTap: () {},
                                  onDeleteTap: () {},
                                ),
                          );
                        },
                        splashColor: ConstantColors.lGrey.withOpacity(0.2),
                        highlightColor: ConstantColors.lGrey.withOpacity(0.1),
                        child: Ink(
                          decoration: BoxDecoration(
                            color:
                                isDark
                                    ? ConstantColors.darkerGrey
                                    : ConstantColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: ConstantSizes.defaultSpace / 1.8,
                              right: ConstantSizes.defaultSpace / 1.5,
                              bottom: ConstantSizes.defaultSpace / 1.8,
                              top: ConstantSizes.defaultSpace / 1.2,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: ConstantColors.active,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  isDark
                                                      ? ConstantColors.black
                                                      : ConstantColors.white,
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              ConstantSizes.spaceBtwItems / 2.5,
                                        ),
                                        Stack(
                                          children: [
                                            CustomCircularContainer(
                                              radius: 100,
                                              width: 40,
                                              height: 40,
                                              backgroundColor: ConstantColors
                                                  .auth
                                                  .withOpacity(0.1),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              bottom: 0,
                                              left: 0,
                                              child: RoundedImage(
                                                image: ConstantImages.car,
                                                width: 30,
                                                height: 30,
                                                backgroundColor:
                                                    Colors.transparent,
                                                imageColor: ConstantColors.auth,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width:
                                              ConstantSizes.spaceBtwSections /
                                              2.5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nissan 370z' + ' - Not Needed',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '1/05/2025',
                                              style: TextStyle(
                                                color:
                                                    isDark
                                                        ? ConstantColors.white
                                                        : ConstantColors.black,
                                                fontSize: 12.5,
                                                fontWeight: FontWeight.w200,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$12000',
                                          style: TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.w500,
                                            color: ConstantColors.error,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          FontAwesomeIcons.chevronRight,
                                          size: 12.5,
                                          color:
                                              isDark
                                                  ? ConstantColors.dGrey
                                                  : ConstantColors.lGrey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                if (index < allRecordsCount - 1)
                                  Divider(
                                    height: 0,
                                    thickness: 0.5,
                                    indent: 65,
                                    endIndent: 0,
                                    color:
                                        isDark
                                            ? ConstantColors.darkGrey
                                            : ConstantColors.grey,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
