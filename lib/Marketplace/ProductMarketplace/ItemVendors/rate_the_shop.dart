import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

import '../ProductMarketplaceWidgets/textfield_widget.dart';

class RateTheShop extends StatefulWidget {
  final String shopName;
  final String shopImage;

  const RateTheShop({required this.shopName, required this.shopImage});

  @override
  State<RateTheShop> createState() => _RateTheShopState();
}

class _RateTheShopState extends State<RateTheShop> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Review The Shop',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.15,
                backgroundColor: AppColors.grayscale10,
                backgroundImage: AssetImage(widget.shopImage),
              ),
            ),
            const SizedBox(height: 10),
            // Shop Name
            Center(
              child: Text(widget.shopName,
                  style: AppFonts.title4(color: AppColors.grayscale90)),
            ),

            const SizedBox(
              height: 20,
            ),
            Text(
              'Enter Your Name',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFieldWidget(
              hintText: 'Enter Your Name',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Rate The Product',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: 3,
              unratedColor: AppColors.grayscale30,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: AppColors.secondary50),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Leave A Review',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust border radius here
                border: Border.all(
                  color: AppColors.grayscale20, // Outline color
                ),
                color: Colors.white, // Background color
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style:
                      const TextStyle(fontSize: 14.0), // Adjust font size here
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter Review',
                    hintStyle: AppFonts.body2(color: AppColors.grayscale50),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primary50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Review',
                      style: AppFonts.body1(color: AppColors.grayscale0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
