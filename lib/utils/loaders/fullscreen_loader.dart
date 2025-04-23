import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/enum/enum.dart';
import '../constants/colors.dart';
import '../helpers/helper.dart';
import '../loaders/animation.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      barrierColor:
          HelperFunctions.isDarkMode(Get.context!)
              ? ConstantColors.dark
              : ConstantColors.white,
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color:
                  HelperFunctions.isDarkMode(Get.context!)
                      ? ConstantColors.dark
                      : ConstantColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  AnimationLoaderWidget(
                    text: text,
                    animation: animation,
                    animationType: AnimationType.json,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
