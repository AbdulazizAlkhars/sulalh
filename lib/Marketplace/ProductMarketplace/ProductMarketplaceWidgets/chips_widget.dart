import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../../../Theme/Fonts.dart';

class ChipsWidget extends StatefulWidget {
  final String label;
  final Function()? onTap;

  const ChipsWidget({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  _ChipsWidgetState createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: AppColors.grayscale20),
                      color: isSelected
                          ? AppColors.secondary30
                          : AppColors.grayscale00,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Text(
                        widget.label,
                        style: AppFonts.body2(color: AppColors.grayscale100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
