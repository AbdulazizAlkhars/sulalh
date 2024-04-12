import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:intl/intl.dart';

class MyOrderCard extends StatelessWidget {
  final DateTime date;
  final DateTime deliverydate;
  final String id;
  final String status;
  final int numberOfItems;
  final List<String> itemImages;

  MyOrderCard({
    required this.date,
    required this.deliverydate,
    required this.id,
    required this.status,
    required this.numberOfItems,
    required this.itemImages,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColors = {
      'Pending': AppColors.secondary30,
      'Delivered': AppColors.primary10,
      'Cancelled': AppColors.grayscale10,
      // Add more status-color pairs as needed
    };

    // Get the color corresponding to the status
    final Color chipColor =
        statusColors.containsKey(status) ? statusColors[status]! : Colors.grey;
    final formattedDate = DateFormat('MMMM d, yyyy').format(date);
    String deliveryText = '';
    if (status == 'Pending') {
      deliveryText =
          'Delivery On ${DateFormat('MMMM d, yyyy').format(deliverydate)}';
    } else if (status == 'Cancelled') {
      deliveryText =
          'Order Cancelled On ${DateFormat('MMMM d, yyyy').format(deliverydate)}';
    } else if (status == 'Delivered') {
      deliveryText =
          'Order Delivered On ${DateFormat('MMMM d, yyyy').format(deliverydate)}';
    }
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order Created On $formattedDate',
                  style: AppFonts.title5(
                    color: AppColors.grayscale90,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Order ID: $id',
              style: AppFonts.body2(
                color: AppColors.grayscale60,
              ),
            ),
            Chip(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Adjust the radius as needed
                side: const BorderSide(
                    color: Colors.transparent), // Make outline transparent
              ),
              backgroundColor: chipColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ), // Adjust padding as needed
              label: Text(
                status,
                style: AppFonts.body2(
                  color: AppColors.grayscale90,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  deliveryText,
                  style: AppFonts.body2(
                    color: AppColors.grayscale60,
                  ),
                ),
                Spacer(),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.primary40,
                ),
              ],
            ), // Show delivery date text based on status
            const SizedBox(height: 5),
            Text(
              '$numberOfItems Items',
              style: AppFonts.caption2(
                color: AppColors.grayscale60,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        subtitle: SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: itemImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  itemImages[index],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
