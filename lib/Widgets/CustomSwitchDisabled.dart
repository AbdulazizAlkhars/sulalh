import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';

class CustomSwitchDisabled extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;

  const CustomSwitchDisabled({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchDisabledState createState() => _CustomSwitchDisabledState();
}

class _CustomSwitchDisabledState extends State<CustomSwitchDisabled> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        _value ? AppColors.grayscale50 : AppColors.grayscale20;
    final circleColor = _value ? AppColors.grayscale20 : AppColors.grayscale30;

    return Container(
      width: 50.0,
      height: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
      ),
      child: Stack(
        children: [
          Positioned(
            left: _value ? 20.0 : 0.0,
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
                border: Border.all(
                  color: backgroundColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//Example of use:
// CustomSwitchDisabled(
//             value: true, // or false depending on the initial state
//             onChanged: (bool value) {
//               // Handle the value change here
//             },
//           ),