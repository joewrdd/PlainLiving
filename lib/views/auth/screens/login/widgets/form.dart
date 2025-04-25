import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plainliving/common/widgets/ios/text_selection.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/images.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plainliving/views/auth/screens/signup/signup.dart';
import 'package:plainliving/views/home/navigation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
                "Login",
                style: GoogleFonts.benne(
                  fontSize: 42,
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
            "Get Back To Smart Money Saving!",
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
                  // Email
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
                      final List<ContextMenuButtonItem> buttonItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        anchors: editableTextState.contextMenuAnchors,
                        buttonItems: buttonItems,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwInputFields),

                  // Password
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
                      final List<ContextMenuButtonItem> buttonItems =
                          editableTextState.contextMenuButtonItems;
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        anchors: editableTextState.contextMenuAnchors,
                        buttonItems: buttonItems,
                      );
                    },
                    selectionControls: BlackThemeTextSelectionControls(),
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwItems / 2),

                  // Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          overlayColor: Colors.transparent,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: ConstantSizes.spaceBtwSections + 10),

                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const NavigationMenu()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? Colors.white : Colors.black,
                        foregroundColor: isDark ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ConstantSizes.buttonCircular,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: ConstantSizes.buttonHeight,
                        ),
                      ),
                      child: Text(
                        'Log In',
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
                        "Don't have an account?",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const SignUpScreen()),
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
