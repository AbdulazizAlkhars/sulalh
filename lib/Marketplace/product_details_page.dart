import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hathera_demo/Marketplace/chips_widget.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';
import '../Widgets/TagChips.dart';

class ProductDetailsPage extends StatefulWidget {
  final int index;

  const ProductDetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Item',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 12 / 9,
                  viewportFraction: 1.0, // Occupies entire viewport
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: [
                  'assets/Marketplace/Frame 1.png',
                  'assets/Marketplace/Frame 1.png',
                  'assets/Marketplace/Frame 1.png'
                ].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        item,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == i
                            ? AppColors.primary50
                            : AppColors.primary0,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              // Product details text here...
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Milktech Silver Premium Calf & Foal Milk Replacer 20kg ${widget.index}', // Replace with product name
                      style: AppFonts.title5(color: AppColors.grayscale90),
                      softWrap: true, // Enable text wrapping
                    ),
                  ),
                  Row(
                    children: [
                      Text('\$80', // Replace with actual discounted price
                          style: AppFonts.title4(color: AppColors.primary40)),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        '\$100', // Replace with actual price
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.grayscale50,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment
                      .start, // Align chips at the start of the horizontal axis
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ChipsWidget(
                      label: 'Horse',
                      onTap: () {
                        // Do something when the chip is tapped
                      },
                    ),
                    ChipsWidget(
                      label: 'Cleaning & Hygiene',
                      onTap: () {
                        // Do something when the chip is tapped
                      },
                    ),

                    // Add more chips as needed
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.secondary10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: AppColors.secondary50),
                                  const SizedBox(width: 5),
                                  Text(
                                    '4.5', // Replace with actual ratings
                                    style: AppFonts.caption2(
                                        color: AppColors.grayscale90),
                                  ),
                                ],
                              ),
                              Text(
                                '12 Reviews',
                                style: AppFonts.body2(
                                    color: AppColors.grayscale90),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.primary20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.secondary10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Align content vertically at center
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  'assets/Marketplace/Frame 2087325740 5.png',
                                ),
                              ),
                              SizedBox(
                                  width:
                                      8), // Add spacing between avatar and name
                              Text(
                                'Farm Shop', // Replace with actual name
                                style: TextStyle(
                                  color: AppColors.grayscale90,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(), // Add spacer to push icon to the right
                              Icon(
                                Icons.chevron_right,
                                color: AppColors.primary20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description', // Replace with actual name
                    style: AppFonts.headline2(color: AppColors.grayscale90),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Sulphate free, soap free and pH balanced \nContains pro-vitamins and vegetable derived conditioning agents \nMoisturising and soothing with oat extract and aloe vera \nPleasantly smelling – contains lavender oil',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary50,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              'Add To Cart',
              style: AppFonts.body1(color: AppColors.grayscale0),
            ),
          ),
        ),
      ),
    );
  }
}