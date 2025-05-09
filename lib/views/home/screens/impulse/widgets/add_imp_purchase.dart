import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/screens/res/widgets/select_category_modalsheet.dart';

class AddImpulsePurchaseModalSheet extends StatelessWidget {
  const AddImpulsePurchaseModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: BoxDecoration(
        color: isDark ? ConstantColors.dark : ConstantColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstantSizes.borderRadiusLg),
          topRight: Radius.circular(ConstantSizes.borderRadiusLg),
        ),
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
                      'Record Impulse Purchase',
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
                  'Product Name',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        isDark
                            ? ConstantColors.bgTextField
                            : ConstantColors.lightContainer,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: ConstantSizes.defaultSpace / 1.5,
                    ),

                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                Text(
                  'Amount',
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
                  'Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConstantColors.darkerGrey,
                  ),
                ),
                const SizedBox(height: 6),
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
                                isDark
                                    ? ConstantColors.dark
                                    : ConstantColors.white,
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
                      'Reflection',
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
                      hintText: 'Record why you made this impulse purchase...',
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
                      'Add Record',
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
    );
  }
}
