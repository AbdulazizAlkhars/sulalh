import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

class AutoDeliveryWidget extends StatefulWidget {
  @override
  _AutoDeliveryWidgetState createState() => _AutoDeliveryWidgetState();
}

class _AutoDeliveryWidgetState extends State<AutoDeliveryWidget> {
  bool isSelected = false;
  String selectedPeriod = "Select Period"; // Default period

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Auto Delivery',
                      style: AppFonts.title5(color: AppColors.grayscale90),
                    ),
                    Text(
                      'These Items Will be Repeated & Delivered Automatically',
                      style: AppFonts.caption2(color: AppColors.grayscale90),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.064, // Adjust the width as needed
                height: MediaQuery.of(context).size.width *
                    0.064, // Adjust the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary20
                        : AppColors.grayscale30,
                    width: isSelected ? 6.0 : 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isSelected)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Deliver Every',
                        style: AppFonts.body1(color: AppColors.grayscale90),
                      ),
                    ),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              selectedPeriod,
                              style:
                                  AppFonts.body2(color: AppColors.grayscale90),
                            ),
                            PopupMenuButton<String>(
                              color: AppColors.grayscale00,
                              surfaceTintColor: AppColors.grayscale00,
                              onSelected: (String value) {
                                setState(() {
                                  selectedPeriod = value;
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return autoDeliveryPeriod.map((String period) {
                                  return PopupMenuItem<String>(
                                    value: period,
                                    child: Text(
                                      period,
                                      style: AppFonts.body2(
                                          color: AppColors.grayscale90),
                                    ),
                                  );
                                }).toList();
                              },
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.primary50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
