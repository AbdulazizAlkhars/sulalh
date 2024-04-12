import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../ProductMarketplace/ProductMarketplaceWidgets/textfield_widget.dart';

class RateItemPage extends StatefulWidget {
  final String itemName;
  final String itemImage;
  final String itemPrice;

  const RateItemPage({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  }) : super(key: key);

  @override
  State<RateItemPage> createState() => _RateItemPageState();
}

class _RateItemPageState extends State<RateItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Rate The Item',
          style: AppFonts.headline3(
            color: AppColors.grayscale90,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.itemImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemName,
                        style: AppFonts.body2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${widget.itemPrice}',
                        style: AppFonts.headline4(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Enter The Name',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(
              hintText: 'Enter The Name',
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Rate The Product',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RatingBar.builder(
              initialRating: 3,
              unratedColor: AppColors.grayscale30,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: AppColors.secondary50),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Leave A Review',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(30.0), // Adjust border radius here
                border: Border.all(
                  color: AppColors.grayscale20, // Outline color
                ),
                color: Colors.white, // Background color
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontSize: 14.0), // Adjust font size here
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter Review',
                    hintStyle: AppFonts.body2(color: AppColors.grayscale50),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                            'Send Review',
                            style: AppFonts.body1(color: AppColors.grayscale0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
