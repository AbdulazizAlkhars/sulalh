import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:intl/intl.dart';

import '../../Theme/Colors.dart';
import '../Lists.dart';
import 'ProductMarketplaceWidgets/rating_summary_widget.dart';

// ReviewsPage widget
class ReviewsPage extends StatefulWidget {
  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final int fiveStarCount = 10;
  final int fourStarCount = 5;
  final int threeStarCount = 3;
  final int twoStarCount = 2;
  final int oneStarCount = 1;
  final int totalReviews = 21; // Total number of reviews

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reviews',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Add a Review',
                style: AppFonts.body1(
                  color: AppColors.primary50,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingSummaryWidget(
              reviews: reviews,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  // Build each review item using data from the reviews list
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              reviews[index].reviewerName,
                              style: AppFonts.headline3(
                                  color: AppColors.grayscale90),
                            ),
                            Text(
                              DateFormat(
                                'MMM d, yyyy',
                              ).format(reviews[index].date),
                              style: AppFonts.caption2(
                                  color: AppColors.grayscale90),
                            ),
                          ],
                        ),
                        Row(
                          children: List.generate(
                            reviews[index].rating,
                            (i) => Icon(Icons.star,
                                size: 20, color: AppColors.secondary50),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(reviews[index].reviewText),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReviewsPage(),
  ));
}
