import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  // Checks for an active internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could Not Launch $url';
    }
  }

  static Future<ImageSource?> selectImageSource(BuildContext context) async {
    final dark = HelperFunctions.isDarkMode(context);
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder:
            (context) => CupertinoActionSheet(
              title: const Text('Select Image Source'),
              actions: [
                CupertinoActionSheetAction(
                  onPressed:
                      () => Navigator.of(context).pop(ImageSource.gallery),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      color:
                          dark
                              ? ConstantColors.buttonSecondary
                              : ConstantColors.black,
                    ),
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed:
                      () => Navigator.of(context).pop(ImageSource.camera),
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      color:
                          dark
                              ? ConstantColors.buttonSecondary
                              : ConstantColors.black,
                    ),
                  ),
                ),
              ],
            ),
      );
    } else {
      return showDialog<ImageSource>(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Select Image Source'),
              actions: [
                TextButton(
                  onPressed:
                      () => Navigator.of(context).pop(ImageSource.gallery),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      color:
                          dark
                              ? ConstantColors.buttonSecondary
                              : ConstantColors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed:
                      () => Navigator.of(context).pop(ImageSource.camera),
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      color:
                          dark
                              ? ConstantColors.buttonSecondary
                              : ConstantColors.black,
                    ),
                  ),
                ),
              ],
            ),
      );
    }
  }
}
