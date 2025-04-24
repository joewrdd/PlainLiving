import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/common/widgets/ios/text_selection.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/images.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/main/screens/login/login.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(
        top: ConstantSizes.defaultSpace,
        left: ConstantSizes.defaultSpace,
        right: ConstantSizes.defaultSpace,
        bottom: ConstantSizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Create Account',
                style: GoogleFonts.benne(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: isDark ? ConstantColors.white : ConstantColors.dark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: ConstantSizes.borderRadiusMd,
                ),
                child: Image.asset(
                  isDark ? ConstantImages.logoWhite : ConstantImages.logoBlack,
                  width: 42,
                  height: 42,
                ),
              ),
            ],
          ),
          Text(
            'Start Your Financial Freedom Now!',
            style: GoogleFonts.benne(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: isDark ? ConstantColors.white : ConstantColors.dark,
            ),
          ),
          const SizedBox(height: ConstantSizes.spaceBtwItems),
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ConstantSizes.spaceBtwInputFields,
              ),
              child: Column(
                children: [
                  // Email Input
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    cursorColor:
                        isDark ? ConstantColors.white : ConstantColors.dark,
                    contextMenuBuilder: (context, editableTextState) {
                      final List<ContextMenuButtonItem> buttomItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        buttonItems: buttomItems,
                        anchors: editableTextState.contextMenuAnchors,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    cursorColor:
                        isDark ? ConstantColors.white : ConstantColors.dark,
                    contextMenuBuilder: (context, editableTextState) {
                      final List<ContextMenuButtonItem> buttomItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        buttonItems: buttomItems,
                        anchors: editableTextState.contextMenuAnchors,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    cursorColor:
                        isDark ? ConstantColors.white : ConstantColors.dark,
                    contextMenuBuilder: (context, editableTextState) {
                      final List<ContextMenuButtonItem> buttomItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        buttonItems: buttomItems,
                        anchors: editableTextState.contextMenuAnchors,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          FontAwesomeIcons.solidEyeSlash,
                          size: 20,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),

                        onPressed: () {},
                      ),
                    ),
                    cursorColor:
                        isDark ? ConstantColors.white : ConstantColors.dark,
                    contextMenuBuilder: (context, editableTextState) {
                      final List<ContextMenuButtonItem> buttomItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        buttonItems: buttomItems,
                        anchors: editableTextState.contextMenuAnchors,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),
                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          FontAwesomeIcons.solidEyeSlash,
                          size: 20,
                          color:
                              isDark
                                  ? ConstantColors.white
                                  : ConstantColors.dark,
                        ),

                        onPressed: () {},
                      ),
                    ),
                    cursorColor:
                        isDark ? ConstantColors.white : ConstantColors.dark,
                    contextMenuBuilder: (context, editableTextState) {
                      final List<ContextMenuButtonItem> buttomItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        buttonItems: buttomItems,
                        anchors: editableTextState.contextMenuAnchors,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwSections + 10),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? Colors.white : Colors.black,
                        foregroundColor: isDark ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ConstantSizes.buttonCircular,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ConstantSizes.buttonHeight,
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.benne(fontSize: 19),
                      ),
                    ),
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwSections + 20),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      const SizedBox(width: ConstantSizes.spaceBtwItems),
                      Text('Or'),
                      const SizedBox(width: ConstantSizes.spaceBtwItems),
                      Expanded(
                        child: Divider(
                          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwSections),

                  // Google Sign In Button & Facebook Sign In Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Sign In Button
                      SizedBox(
                        width: 58,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                isDark ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ConstantSizes.buttonCircular,
                              ),
                            ),
                          ),
                          child: Center(child: Icon(FontAwesomeIcons.google)),
                        ),
                      ),

                      const SizedBox(width: ConstantSizes.spaceBtwItems),
                      // Facebook Sign In Button
                      SizedBox(
                        width: 58,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                isDark ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ConstantSizes.buttonCircular,
                              ),
                            ),
                          ),
                          child: Center(child: Icon(FontAwesomeIcons.facebook)),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwSections),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const LoginScreen()),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 13,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
