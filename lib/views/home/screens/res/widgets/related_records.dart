import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plainliving/common/widgets/layout/listview_layout.dart';
import 'package:plainliving/common/widgets/shapes/circle_container.dart';
import 'package:plainliving/utils/constants/colors.dart';
import 'package:plainliving/utils/constants/sizes.dart';
import 'package:plainliving/utils/helpers/helper.dart';

class RelatedRecords extends StatelessWidget {
  const RelatedRecords({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final int recordCount = 2;
    return Container(
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isDark ? ConstantColors.black : ConstantColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(ConstantSizes.defaultSpace / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Related Records',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: ConstantSizes.spaceBtwItems),
            CustomListViewLayout(
              itemCount: recordCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: ConstantSizes.defaultSpace / 2,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  CustomCircularContainer(
                                    radius: 100,
                                    width: 50,
                                    height: 50,
                                    backgroundColor: ConstantColors.softGrey,
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    bottom: 0,
                                    left: 0,
                                    child: Icon(
                                      FontAwesomeIcons.arrowUp,
                                      size: 16,
                                      color: ConstantColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: ConstantSizes.spaceBtwSections / 2.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ASUS Monitor',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '1/05/2025',
                                    style: TextStyle(
                                      color:
                                          isDark
                                              ? ConstantColors.white
                                              : ConstantColors.black,
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w200,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '+\$1100',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      if (index < recordCount - 1)
                        Divider(
                          height: 0,
                          thickness: 0.5,
                          indent: 65,
                          endIndent: 0,
                          color:
                              isDark
                                  ? ConstantColors.darkGrey
                                  : ConstantColors.grey,
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
