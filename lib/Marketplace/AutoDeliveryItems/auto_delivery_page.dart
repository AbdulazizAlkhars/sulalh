import 'package:flutter/material.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import 'auto_delivery_items.dart';

class AutoDeliveryPage extends StatefulWidget {
  @override
  _AutoDeliveryPageState createState() => _AutoDeliveryPageState();
}

class _AutoDeliveryPageState extends State<AutoDeliveryPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grayscale00,
        surfaceTintColor: AppColors.grayscale00,
        centerTitle: true,
        title: Text(
          'Auto Delivery Orders',
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
          IconButton(
            icon: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: const AutoDeliveryItemsList(),
    );
  }
}
