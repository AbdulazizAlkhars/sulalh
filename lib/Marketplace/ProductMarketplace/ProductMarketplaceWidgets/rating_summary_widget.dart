import 'package:flutter/material.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

class RatingSummaryWidget extends StatelessWidget {
  final List<Review> reviews;

  const RatingSummaryWidget({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int totalReviews = reviews.length;
    final List<int> starCounts = [0, 0, 0, 0, 0];

    // Count the number of reviews for each star rating
    for (var review in reviews) {
      starCounts[review.rating - 1]++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Ratings',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '($totalReviews)',
              style: AppFonts.title5(
                color: AppColors.grayscale90,
              ),
            ),
            const Spacer(),
            const Icon(Icons.star, size: 30, color: AppColors.secondary50),
            Text(
              calculateAverageRating(starCounts).toStringAsFixed(1),
              style: AppFonts.title4(
                color: AppColors.grayscale90,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildRatingBar('5', starCounts[4], totalReviews),
        const SizedBox(
          height: 8,
        ),
        _buildRatingBar('4', starCounts[3], totalReviews),
        const SizedBox(
          height: 8,
        ),
        _buildRatingBar('3', starCounts[2], totalReviews),
        const SizedBox(
          height: 8,
        ),
        _buildRatingBar('2', starCounts[1], totalReviews),
        const SizedBox(
          height: 8,
        ),
        _buildRatingBar('1', starCounts[0], totalReviews),
        const SizedBox(
          height: 8,
        ),
        const Divider(),
      ],
    );
  }

  double calculateAverageRating(List<int> starCounts) {
    final totalSum = 5 * starCounts[4] +
        4 * starCounts[3] +
        3 * starCounts[2] +
        2 * starCounts[1] +
        1 * starCounts[0];
    final totalCount = starCounts.reduce((value, element) => value + element);
    return totalSum / totalCount;
  }

  Widget _buildRatingBar(String label, int count, int total) {
    final double percentage = count / total;
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(Icons.star, size: 20, color: AppColors.secondary50),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 6,
            borderRadius: BorderRadius.circular(30),
            value: percentage,
            backgroundColor: AppColors.grayscale20,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.secondary50),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${(percentage * 100).toStringAsFixed(1)}%',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
