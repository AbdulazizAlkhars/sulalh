import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class MyOrderCard extends StatelessWidget {
  final String date;
  final String id;
  final String status;
  final int numberOfItems;
  final List<String> itemImages;

  MyOrderCard({
    required this.date,
    required this.id,
    required this.status,
    required this.numberOfItems,
    required this.itemImages,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColors = {
      'Pending': Colors.orange,
      'Delivered': Colors.green,
      'Cancelled': Colors.red,
      // Add more status-color pairs as needed
    };

    // Get the color corresponding to the status
    final Color chipColor =
        statusColors.containsKey(status) ? statusColors[status]! : Colors.grey;

    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Order Created On:'),
                Spacer(),
                Text(' $date'),
              ],
            ),
            SizedBox(height: 5),
            Text('Order ID: $id'),
            SizedBox(height: 5),
            Row(
              children: [
                Text('Status: '),
                Chip(
                  backgroundColor: chipColor,
                  label: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text('Number of Items: $numberOfItems'),
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
                padding: EdgeInsets.only(right: 5),
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
