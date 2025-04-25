import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';
import 'package:plainliving/views/auth/screens/login/widgets/form.dart';
import 'package:plainliving/views/auth/screens/login/widgets/header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDark ? ConstantColors.dark : ConstantColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [LoginHeaderBackground(), LoginForm()],
        ),
      ),
    );
  }
}
