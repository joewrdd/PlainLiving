import 'package:flutter/material.dart';
import 'painter_text_selection.dart';

class BlackThemeTextSelectionControls extends MaterialTextSelectionControls {
  @override
  Widget buildHandle(
    BuildContext context,
    TextSelectionHandleType type,
    double textHeight, [
    VoidCallback? onTap,
  ]) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      width: 22.0,
      height: 22.0,
      child: CustomPaint(
        painter: CustomTextSelectionHandlePainter(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
