import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/common/widgets/app/app_bar.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/views/home/controllers/scroll_controller.dart';
import 'package:plainliving/views/home/screens/res/widgets/main_container.dart';

class RestraintScreen extends StatelessWidget {
  const RestraintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScrollController());
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Limiting Spending'),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(ConstantSizes.defaultSpace / 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Limiting Spending',
                  style: GoogleFonts.benne(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MainContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
