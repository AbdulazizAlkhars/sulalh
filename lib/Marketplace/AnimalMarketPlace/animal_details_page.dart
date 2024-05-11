import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlaceWidgets/chips_widget.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Lists.dart';
import '../ProductMarketplace/ProductMarketPlacePages/ratings_reviews.dart';

class AnimalDetailsPage extends StatefulWidget {
  final int index;
  final AnimalDetails animal;

  const AnimalDetailsPage({Key? key, required this.animal, required this.index})
      : super(key: key);

  @override
  _AnimalDetailsPageState createState() => _AnimalDetailsPageState();
}

class _AnimalDetailsPageState extends State<AnimalDetailsPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  late TabController _tabController;
  int _currentIndex = 0;
  bool _showAddToCartButton = true; // Flag to show/hide Add to Cart button
  int _quantity = 1; // Initialize quantity to 1
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
          'Animal',
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
                  widget.animal.imagePath,
                  widget.animal.imagePath,
                  widget.animal.imagePath,
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
                      widget.animal.animalName, // Replace with product name
                      style: AppFonts.title5(color: AppColors.grayscale90),
                      softWrap: true, // Enable text wrapping
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                          widget.animal
                              .discountedPrice, // Replace with actual discounted price
                          style: AppFonts.title4(color: AppColors.primary40)),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.animal.actualPrice, // Replace with actual price
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
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.grayscale10,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppColors.primary50,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                  labelColor: AppColors.grayscale0,
                  unselectedLabelColor: AppColors.grayscale60,
                  labelStyle: AppFonts.body2(color: AppColors.grayscale0),
                  tabs: [
                    Tab(text: 'General'),
                    Tab(text: 'Breeding'),
                    Tab(text: 'Medical'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            child: _showAddToCartButton
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showAddToCartButton = false; // Hide initial button
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primary50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Add To Cart',
                      style: AppFonts.body1(color: AppColors.grayscale0),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle the action of the additional button
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.grayscale10,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Added To Cart',
                            style: AppFonts.body1(color: AppColors.grayscale90),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.grayscale10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (_quantity > 1) {
                                      _quantity--; // Decrease quantity by 1
                                    }
                                    if (_quantity <= 1) {
                                      _showAddToCartButton =
                                          true; // Show initial button
                                    }
                                  });
                                },
                              ),
                              Text(
                                _quantity
                                    .toString(), // Display the current quantity
                                style: AppFonts.body1(
                                    color: AppColors.grayscale90),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _quantity++; // Increase quantity by 1
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
