import 'package:flutter/material.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

import 'vendor_shop_details.dart';
import 'vendor_shop_items.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: AppColors.grayscale20,
                        ), // Outline color
                        color: Colors.white, // Background color
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: AppColors.grayscale50,
                          ), // Change hint text color
                          prefixIcon:
                              Icon(Icons.search, color: AppColors.primary30),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.020),
                            decoration: BoxDecoration(
                              color: AppColors.grayscale10,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.filter_list,
                                color: AppColors.primary30),
                          ), // Icon at the right side
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
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
                                      MediaQuery.of(context).size.width * 0.14,
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
                                      horizontal: 10, vertical: 2),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VendorShopItems(
                                                  index: index,
                                                )),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: AppColors.grayscale0,
                                      backgroundColor: AppColors
                                          .primary40, // Text color of button
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
