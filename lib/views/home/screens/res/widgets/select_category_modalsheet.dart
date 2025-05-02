import 'package:flutter/material.dart';
import 'package:plainliving/utils/constants/sizes.dart';

class SelectCategoryModalSheet extends StatelessWidget {
  const SelectCategoryModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.92,
      child: Padding(
        padding: EdgeInsets.only(
          top: ConstantSizes.defaultSpace / 2,
          left: 6,
          right: 6,
          bottom: ConstantSizes.defaultSpace,
        ),
        child: Column(children: [
            
          ],  
        ),
      ),
    );
  }
}
