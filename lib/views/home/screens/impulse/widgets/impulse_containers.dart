import 'package:flutter/material.dart';
import 'package:plainliving/common/widgets/shapes/circular_rectangle_container.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';

class ImpulseContainers extends StatelessWidget {
  const ImpulseContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularRectangleContainer(
              title: 'Total Amount',
              amount: '\$${1000.00}',
              colors: [
                ConstantColors.impulsePink,
                ConstantColors.impulsePink.withOpacity(0.6),
              ],
            ),
            CircularRectangleContainer(
              title: 'Monthly Amount',
              amount: '\$${521.00}',
              colors: [
                ConstantColors.impulsePaleBlue,
                ConstantColors.impulsePaleBlue.withOpacity(0.6),
              ],
            ),
          ],
        ),
        SizedBox(height: ConstantSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularRectangleContainer(
              title: 'Total Count',
              amount: '10',
              colors: [
                ConstantColors.impulsePalePink,
                ConstantColors.impulsePalePink.withOpacity(0.6),
              ],
            ),
            CircularRectangleContainer(
              title: 'Monthly Count',
              amount: '0',
              colors: [
                Color.fromARGB(255, 255, 192, 84),
                Color.fromARGB(255, 255, 228, 76).withOpacity(0.6),
              ],
            ),
          ],
        ),
        SizedBox(height: ConstantSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularRectangleContainer(
              title: 'Average',
              amount: '\$${781.00}',
              colors: [
                ConstantColors.impulsePaleNeonBlue,
                ConstantColors.impulsePaleNeonBlue.withOpacity(0.4),
              ],
            ),
            CircularRectangleContainer(
              title: 'Total Reflections',
              amount: '2',
              colors: [
                const Color.fromARGB(255, 176, 106, 255),
                const Color.fromARGB(255, 176, 106, 255).withOpacity(0.6),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
