import 'package:flutter/material.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';

// Assuming a typical gestation period for a cat is 65 days
const int catGestationPeriod = 65;
const int lastWeekThreshold = 7;

class PregnancyProgressBar extends StatefulWidget {
  final int daysPregnant;
  final bool isDelivered;
  final ValueChanged<bool> onDeliveredChanged;

  PregnancyProgressBar({
    required this.daysPregnant,
    required this.isDelivered,
    required this.onDeliveredChanged,
  });

  @override
  _PregnancyProgressBarState createState() => _PregnancyProgressBarState();
}

class _PregnancyProgressBarState extends State<PregnancyProgressBar> {
  void _showCongratulatoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.grayscale00,
          title: Text(
            'Congratulations!',
            style: AppFonts.title5(color: AppColors.grayscale100),
          ),
          content: Text(
            'The pregnancy is complete. Please add the new kittens to your family tree.',
            style: AppFonts.body1(color: AppColors.grayscale100),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: AppColors.grayscale20),
                  color: AppColors.primary50),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: AppFonts.body1(color: AppColors.grayscale00),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = widget.daysPregnant / catGestationPeriod;
    progress =
        progress > 1.0 ? 1.0 : progress; // Ensure progress does not exceed 1.0

    // Determine if we're in the last week
    bool isInLastWeek =
        (catGestationPeriod - widget.daysPregnant) <= lastWeekThreshold;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.grayscale20,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      isInLastWeek ? Colors.yellow[600]! : AppColors.primary30,
                      isInLastWeek ? Colors.yellow[800]! : AppColors.primary50
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Visibility(
              visible: isInLastWeek,
              child: Row(
                children: [
                  Text(
                    'Delivered',
                    style: AppFonts.headline4(color: AppColors.grayscale100),
                  ),
                  Transform.scale(
                    scale: 0.85,
                    child: Switch(
                      value: widget.isDelivered,
                      onChanged: (bool value) {
                        widget.onDeliveredChanged(value);
                        if (value) {
                          _showCongratulatoryDialog();
                        }
                      },
                      activeTrackColor: AppColors.primary40,
                      trackOutlineColor:
                          WidgetStateProperty.all(AppColors.grayscale30),
                      activeColor:
                          AppColors.grayscale00, // Color when switch is on
                      inactiveThumbColor: AppColors
                          .grayscale50, // Color of the thumb when switch is off
                      inactiveTrackColor: AppColors
                          .grayscale00, // Color of the track when switch is off
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              isInLastWeek
                  ? 'Pregnancy expected anytime'
                  : '${widget.daysPregnant}/$catGestationPeriod days',
              style: AppFonts.headline4(color: AppColors.grayscale100),
            ),
          ],
        ),
      ],
    );
  }
}
