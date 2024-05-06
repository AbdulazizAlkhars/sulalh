import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/textfield_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

class AddNewAddress extends StatefulWidget {
  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  bool mapTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Select Address',
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
                Icons.close,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Map widget or placeholder goes here
          GestureDetector(
            onTap: () {
              setState(() {
                mapTapped = !mapTapped;
              });
            },
            child: Container(
              color: AppColors.grayscale20, // Replace with your map widget
              child: const Center(
                child: Text(
                  'Map Placeholder',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          // Modal sheet always open below the map
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    mapTapped
                        ? const SizedBox(
                            height: 5,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abu Dhabi, Al Dhiba St, Villa 19',
                                style: AppFonts.headline3(
                                  color: AppColors.grayscale90,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    color: Colors.black,
                                    Icons.directions_car_filled_outlined,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Delivery On March, 8',
                                    style: AppFonts.body2(
                                      color: AppColors.grayscale90,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    if (mapTapped) ...[
                      // Show text fields when map is tapped
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: AppFonts.caption2(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                            hintText: 'Enter Address',
                            onChanged: (value) {
                              // Handle search query change
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Apartment, Suite etc.,',
                            style: AppFonts.caption2(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                            hintText: 'Enter Apartment, Suite etc.,',
                            onChanged: (value) {
                              // Handle search query change
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Additional Information',
                            style: AppFonts.caption2(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                            hintText: 'Enter Additional Information',
                            onChanged: (value) {
                              // Handle search query change
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Icon(
                                color: Colors.black,
                                Icons.directions_car_filled_outlined,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Delivery On March, 8',
                                style: AppFonts.body2(
                                  color: AppColors.grayscale90,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Text(
                            mapTapped ? 'Confirm Address' : 'Verify Address',
                            style: AppFonts.body1(color: AppColors.grayscale0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
