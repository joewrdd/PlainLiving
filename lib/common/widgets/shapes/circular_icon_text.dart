import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class CustomVerticalImageText extends StatelessWidget {
  const CustomVerticalImageText({
    super.key,
    required this.image,
    this.title,
    this.textColor = ConstantColors.white,
    this.backgroundColor,
    this.onTap,
    this.width = 50,
    this.height = 50,
    this.isNetworkImage = true,
    this.isSelected,
  });

  final String image;
  final String? title;
  final double width, height;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width + 12,
            height: height + 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color:
                    isSelected ?? false
                        ? ConstantColors.black
                        : ConstantColors.darkerGrey.withOpacity(0.4),
                width: isSelected ?? false ? 1 : 0.5,
              ),
            ),
            child: Center(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ?? false
                          ? ConstantColors.black
                          : backgroundColor ??
                              ConstantColors.lightGrey.withOpacity(0.7),
                ),
                child: Center(
                  child:
                      isNetworkImage
                          ? Image.network(
                            image,
                            width: width * 0.6,
                            height: height * 0.6,
                            color:
                                isSelected ?? false
                                    ? Colors.white
                                    : dark
                                    ? Colors.white
                                    : Colors.black,
                          )
                          : Image.asset(
                            image,
                            width: width * 0.6,
                            height: height * 0.6,
                            color:
                                isSelected ?? false
                                    ? Colors.white
                                    : dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: 71,
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
                color: ConstantColors.darkGrey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
