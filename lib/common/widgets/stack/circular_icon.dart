import 'package:flutter/material.dart';
import 'package:plainliving/common/widgets/shapes/circle_container.dart';
import 'package:plainliving/utils/constants/colors.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
    this.onTap,
    required this.icon,
    required this.radius,
    required this.width,
    required this.height,
  });

  final Function()? onTap;
  final IconData icon;
  final double radius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCircularContainer(
          radius: radius,
          width: width,
          height: height,
          backgroundColor: ConstantColors.softGrey,
        ),
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          left: 0,
          child: IconButton(
            onPressed: onTap,
            icon: Icon(icon, size: 16, color: ConstantColors.black),
          ),
        ),
      ],
    );
  }
}
