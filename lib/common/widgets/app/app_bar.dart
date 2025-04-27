import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/home/controllers/scroll_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(AppScrollController());
    return PreferredSize(
      preferredSize: Size.fromHeight(45),
      child: Obx(
        () => AnimatedOpacity(
          opacity: controller.opacity.value > 0.05 ? 1.0 : 0.0,
          duration: Duration(milliseconds: 200),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100 * controller.opacity.value,
                  sigmaY: 100 * controller.opacity.value,
                ),
                child: Container(
                  width: double.infinity,
                  height: 110,
                  color:
                      isDark
                          ? Colors.black.withOpacity(
                            0.5 * controller.opacity.value,
                          )
                          : Colors.white.withOpacity(
                            0.5 * controller.opacity.value,
                          ),
                ),
              ),
            ),
            toolbarHeight: 50,
            title: Text(title),
            centerTitle: true,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45);
}
