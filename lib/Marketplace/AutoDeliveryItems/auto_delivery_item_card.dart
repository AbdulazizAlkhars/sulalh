import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:intl/intl.dart';

class AutoDeliveryItemCard extends StatelessWidget {
  final DateTime date;
  final DateTime deliverydate;
  final String id;
  final String itemPrice;
  final int numberOfItems;
  final List<String> autoDeliveryItemImages;
  final List<String> itemNames;

  AutoDeliveryItemCard({
    required this.date,
    required this.deliverydate,
    required this.id,
    required this.itemPrice,
    required this.numberOfItems,
    required this.autoDeliveryItemImages,
    required this.itemNames,
  });

  @override
  Widget build(BuildContext context) {
    void _showDeleteConfirmation() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Confirm Deletion',
              style: AppFonts.title4(color: AppColors.grayscale90),
            ),
            content: Text(
              'Are you sure you want to cancel this AutoDelivery?',
              style: AppFonts.body1(color: AppColors.grayscale70),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Dismiss the dialog but don't delete
                },
                child: Text(
                  'Cancel',
                  style: AppFonts.body1(color: AppColors.grayscale80),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your deletion logic here
                  Navigator.of(context)
                      .pop(); // Dismiss the dialog after deleting
                },
                child: Text(
                  'Delete',
                  style: AppFonts.body1(color: AppColors.error100),
                ),
              ),
            ],
          );
        },
      );
    }

    // Get the color corresponding to the status
    final formattedDate = DateFormat('MMMM d, yyyy').format(date);
    final formattedNextDeliveryDate =
        DateFormat('MMMM d, yyyy').format(deliverydate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: AppColors.grayscale20),
          color: AppColors.grayscale00,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Next Delivery On $formattedNextDeliveryDate',
                      style: AppFonts.title5(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDeleteConfirmation();
                    },
                    child: const Icon(
                      Icons.delete_outline,
                      color: AppColors.error100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Order ID: $id',
                    style: AppFonts.body2(
                      color: AppColors.grayscale60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Created On $formattedDate',
                    style: AppFonts.body1(
                      color: AppColors.grayscale100,
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
              Row(
                children: [
                  Text(
                    '$numberOfItems Item',
                    style: AppFonts.caption2(
                      color: AppColors.grayscale60,
                    ),
                  ),
                  Spacer(),
                  Text(
                    ' $itemPrice KD',
                    style: AppFonts.headline4(
                      color: AppColors.primary40,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),
            ],
          ),
          subtitle: SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: autoDeliveryItemImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image.asset(
                    autoDeliveryItemImages[index],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
