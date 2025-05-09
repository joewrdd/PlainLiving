import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class CustomActionSheet extends StatelessWidget {
  const CustomActionSheet({
    super.key,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;
  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return CupertinoActionSheet(
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: onEditTap,
          child: Text(
            'Edit Goal',
            style: TextStyle(
              color: isDark ? ConstantColors.white : ConstantColors.black,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: onDeleteTap,
          child: const Text('Delete Goal'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cancel',
          style: TextStyle(
            color: isDark ? ConstantColors.white : ConstantColors.black,
          ),
        ),
      ),
    );
  }
}
