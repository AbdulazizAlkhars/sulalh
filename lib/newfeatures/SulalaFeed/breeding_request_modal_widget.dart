// breeding_request_modal.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';

class BreedingRequestModal extends StatefulWidget {
  final String imagePath;

  const BreedingRequestModal({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _BreedingRequestModalState createState() => _BreedingRequestModalState();
}

class _BreedingRequestModalState extends State<BreedingRequestModal> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: keyboardHeight +
              16.0, // Add extra padding at the bottom for the keyboard
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Request for Breeding',
                style: AppFonts.title4(color: AppColors.grayscale90),
              ),
            ),
            Divider(),
            // const SizedBox(height: 16),
            Text(
              'How much did you like this animal?',
              style: AppFonts.body1(color: AppColors.grayscale90),
            ),
            const SizedBox(height: 8),
            Center(
              child: RatingBar(
                initialRating: 0,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.0,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: AppColors.primary30),
                  half: Icon(Icons.star_half, color: AppColors.primary30),
                  empty: Icon(Icons.star_border, color: AppColors.primary30),
                ),
                onRatingUpdate: (rating) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Enter Your Phone Number',
              style: AppFonts.caption1(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(50.0), // Adjust border radius here
                border: Border.all(
                  color: AppColors.grayscale20, // Outline color
                ),
                color: Colors.white, // Background color
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontSize: 14.0), // Adjust font size here
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number With Country Code',
                    hintStyle: AppFonts.body2(color: AppColors.grayscale50),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Send Request To Breed',
                  style: AppFonts.body1(color: AppColors.grayscale00),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary30,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
