import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class CustomInformation extends StatelessWidget {
  const CustomInformation({
    super.key,
    this.icon = Icons.arrow_forward_ios,
    required this.onTap,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ConstantSizes.spaceBtwItems / 2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? ConstantColors.white : ConstantColors.black,
                      fontWeightDelta: -1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ConstantColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Icon(
                    icon,
                    size: 16,
                    color: dark ? ConstantColors.white : ConstantColors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Divider(
              color: ConstantColors.darkGrey.withOpacity(0.5),
              indent: 0,
              endIndent: 0,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
