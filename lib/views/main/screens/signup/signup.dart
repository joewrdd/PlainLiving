import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/main/screens/signup/widgets/form.dart';
import 'package:plainliving/views/main/screens/signup/widgets/header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDark ? ConstantColors.darker : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SignUpHeader(), SignUpForm()],
        ),
      ),
    );
  }
}
