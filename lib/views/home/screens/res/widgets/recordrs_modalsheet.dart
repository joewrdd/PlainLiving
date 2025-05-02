import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/res/widgets/select_category_modalsheet.dart';

class RecordRSModalSheet extends StatelessWidget {
  const RecordRSModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.92,
      child: Padding(
        padding: EdgeInsets.only(
          top: ConstantSizes.defaultSpace / 2,
          left: 6,
          right: ConstantSizes.defaultSpace / 2,
          bottom: ConstantSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close,
                    color: isDark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        'Record Restraint Spending',
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
            SizedBox(height: ConstantSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.all(ConstantSizes.defaultSpace / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What do you want to buy?',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter product name',
                      filled: true,
                      fillColor:
                          isDark
                              ? ConstantColors.bgTextField
                              : ConstantColors.lightContainer,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: ConstantSizes.defaultSpace / 1.5,
                      ),
                      hintStyle: TextStyle(
                        color: ConstantColors.invTextField,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  Text(
                    'Price',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '\$ 0.00',
                      filled: true,
                      fillColor:
                          isDark
                              ? ConstantColors.bgTextField
                              : ConstantColors.lightContainer,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: ConstantSizes.defaultSpace / 1.5,
                      ),
                      hintStyle: TextStyle(
                        color: ConstantColors.invTextField,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  Text(
                    'Category',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: false,
                        backgroundColor:
                            isDark ? ConstantColors.dark : ConstantColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        builder: (context) => const SelectCategoryModalSheet(),
                      );
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(
                        horizontal: ConstantSizes.defaultSpace / 1.5,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isDark
                                ? ConstantColors.bgTextField
                                : ConstantColors.lightContainer,
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Category',
                            style: TextStyle(
                              color: ConstantColors.invTextField,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: ConstantColors.invTextField,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Text(
                        'Why not buy this?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '(Optional)',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 125,
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText:
                            'Type your reason here, to help yourself resist temptation...',
                        hintStyle: TextStyle(
                          color:
                              isDark
                                  ? ConstantColors.dGrey
                                  : ConstantColors.lGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(12),
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
                        'Save Record',
                        style: TextStyle(
                          color: ConstantColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
