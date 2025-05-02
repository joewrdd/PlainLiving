import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/common/widgets/app/app_bar.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/scroll_controller.dart';
import 'package:plainliving/views/home/screens/res/widgets/main_container.dart';
import 'package:plainliving/views/home/screens/res/widgets/recent_records.dart';
import 'package:plainliving/views/home/screens/res/widgets/recordrs_modalsheet.dart';
import 'package:plainliving/views/home/screens/res/widgets/restraint_goal.dart';

class RestraintScreen extends StatelessWidget {
  const RestraintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScrollController());
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          isDark ? ConstantColors.dark : ConstantColors.lightContainer,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Limiting Spending'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: false,
            backgroundColor:
                isDark ? ConstantColors.dark : ConstantColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            builder: (context) => RecordRSModalSheet(),
          );
        },
        backgroundColor: Colors.grey.shade900,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: ConstantSizes.defaultSpace / 1.5,
                right: ConstantSizes.defaultSpace / 1.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Limiting Spending',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ConstantSizes.spaceBtwItems / 2),
                  MainContainer(),
                  SizedBox(height: ConstantSizes.spaceBtwItems + 8),
                  RestraintGoalContainer(),
                  SizedBox(height: ConstantSizes.spaceBtwItems + 8),
                  RecentRecordsContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
