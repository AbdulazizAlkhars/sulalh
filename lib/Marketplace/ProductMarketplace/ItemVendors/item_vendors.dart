import 'package:flutter/material.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../product_details_page.dart';
import '../vendors_avatars_widget.dart';
import 'vendor_shop_details.dart';

class ItemVendors extends StatefulWidget {
  @override
  State<ItemVendors> createState() => _ItemVendorsState();
}

class _ItemVendorsState extends State<ItemVendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Vendors',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Top Vendors',
                        style: AppFonts.title4(color: AppColors.grayscale90)),
                  ),
                  Expanded(
                    flex: 0,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: AppFonts.body1(color: AppColors.primary40),
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  childAspectRatio: 0.75, // Adjust aspect ratio as needed
                ),
                itemCount: ProductVendorData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final vendor = ProductVendorData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VendorShopDetails(index: index),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors
                              .grayscale10, // Background color for the container
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Circle avatar for the image
                                CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.15,
                                  backgroundColor: AppColors.grayscale10,
                                  backgroundImage: AssetImage(
                                    vendor['imageAsset'],
                                  ),
                                ),
                                // Ratings container overlapped on the circle avatar
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors
                                          .white, // Set background color to white
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 18,
                                          color: AppColors.secondary50,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '4.9',
                                          style: AppFonts.caption2(
                                              color: AppColors.grayscale90),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Text(
                                    vendor['name'],
                                    style: AppFonts.body2(
                                        color: AppColors.grayscale100),
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Elevated button
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle button press
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.grayscale0,
                                      backgroundColor: AppColors
                                          .primary50, // Text color of button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Text(
                                        'View Shop'), // Text displayed on the button
                                  ),
                                ),
                                // Add more content as needed
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
