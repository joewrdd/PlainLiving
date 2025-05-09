import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/common/widgets/app/app_bar.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/scroll_controller.dart';
import 'package:plainliving/views/home/screens/impulse/widgets/add_imp_purchase.dart';
import 'package:plainliving/views/home/screens/impulse/widgets/impulse_containers.dart';
import 'package:plainliving/views/home/screens/impulse/widgets/purchase_records.dart';

class ImpulseScreen extends StatelessWidget {
  const ImpulseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(AppScrollController());
    return Scaffold(
      backgroundColor:
          isDark ? ConstantColors.dark : ConstantColors.lightContainer,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Impulse Purchasing'),
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
            builder: (context) => AddImpulsePurchaseModalSheet(),
          );
        },
        backgroundColor: ConstantColors.impulsePink,
        child: Icon(Icons.add, color: Colors.white),
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
                    'Impulse Purchasing',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ConstantSizes.spaceBtwItems),
                  ImpulseContainers(),
                  SizedBox(height: ConstantSizes.spaceBtwItems / 1.5),
                  PurchaseRecordsContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
