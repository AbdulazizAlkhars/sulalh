import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';

class CheckBoxDisabled extends StatelessWidget {
  final bool checked;

  const CheckBoxDisabled({
    Key? key,
    required this.checked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        checked ? AppColors.grayscale50 : AppColors.grayscale20;
    final borderColor = checked ? AppColors.primary50 : AppColors.grayscale30;
    final checkColor = checked ? AppColors.grayscale20 : null;

    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
      child: checked
          ? Icon(
              Icons.check,
              color: checkColor,
              size: 16.0,
            )
          : null,
    );
  }
}


// Example of use:

// CheckBoxDisabled(
//             checked: true,
//           ),