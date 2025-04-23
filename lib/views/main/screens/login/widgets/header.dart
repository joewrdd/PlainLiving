import 'package:flutter/material.dart';
import 'package:plainliving/common/widgets/shapes/curved_edges.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/images.dart';

class LoginHeaderBackground extends StatelessWidget {
  const LoginHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: CustomCurvedEdges(),
          child: Container(
            color: ConstantColors.dark,
            padding: EdgeInsets.all(0),
            child: SizedBox(
              height: 300,
              child: Image(
                image: AssetImage(ConstantImages.loginBackground),
                fit: BoxFit.cover,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
