import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/chips_widget.dart';
import 'package:intl/intl.dart';
import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import 'ProductMarketplaceWidgets/rating_summary_widget.dart';
import 'checkout_item.dart';
import 'marketplace_items.dart';
import 'ratings_reviews.dart';

class ProductDetailsPage extends StatefulWidget {
  final int index;
  final ProductDetails product;

  const ProductDetailsPage(
      {Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  double totalFinalAmount = 0;
  double totalGrossAmount = 0;
  double totaldiscount = 0;
  int _currentIndex = 0;
// Flag to show/hide Add to Cart button
  int _quantity = 1; // Initialize quantity to 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            : AppColors.grayscale20,
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
                      widget.product.productName, // Replace with product name
                      style: AppFonts.title5(color: AppColors.grayscale90),
                      softWrap: true, // Enable text wrapping
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(widget.product.discountedPrice,
                              style:
                                  AppFonts.title4(color: AppColors.primary40)),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.product.actualPrice,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.grayscale50,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '(${calculateDiscountPercentage(widget.product.actualPrice, widget.product.discountedPrice)}%) Off',
                        style:
                            AppFonts.headline4(color: AppColors.grayscale100),
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewsPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.all(8),
                        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.product.rating.toString(),
                                            style: AppFonts.caption1(
                                              color: AppColors.grayscale90,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Row(
                                            children: List.generate(
                                              5,
                                              (index) {
                                                if (index <
                                                    widget.product.rating
                                                        .floor()) {
                                                  // Full star
                                                  return const Icon(
                                                    Icons.star,
                                                    size: 20,
                                                    color:
                                                        AppColors.secondary50,
                                                  );
                                                } else if (index <
                                                    widget.product.rating) {
                                                  // Half-filled star
                                                  return const Icon(
                                                    Icons.star_half,
                                                    size: 20,
                                                    color:
                                                        AppColors.secondary50,
                                                  );
                                                } else {
                                                  // Empty star
                                                  return const Icon(
                                                    Icons.star_border,
                                                    size: 20,
                                                    color:
                                                        AppColors.secondary50,
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
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
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
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
                    style: AppFonts.body2(color: AppColors.grayscale90),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  RatingSummaryWidget(reviews: reviews),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Reviews',
                          style: AppFonts.title4(color: AppColors.grayscale90),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewsPage()),
                            );
                          },
                          child: Text(
                            'View More',
                            style: AppFonts.body1(color: AppColors.primary40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // Build each review item using data from the reviews list
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  reviews[index].reviewerName,
                                  style: AppFonts.headline4(
                                      color: AppColors.grayscale90),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  children: List.generate(
                                    reviews[index].rating,
                                    (i) => const Icon(Icons.star,
                                        size: 20, color: AppColors.secondary50),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  DateFormat(
                                    'MMM d, yyyy',
                                  ).format(reviews[index].date),
                                  style: AppFonts.caption3(
                                      color: AppColors.grayscale90),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              reviews[index].reviewText,
                              style:
                                  AppFonts.body2(color: AppColors.grayscale90),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Similar Products',
                      style: AppFonts.title4(color: AppColors.grayscale90),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsPage()),
                        );
                      },
                      child: Text(
                        'View More',
                        style: AppFonts.body1(color: AppColors.primary40),
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.2, // Adjust aspect ratio as needed
                ),
                itemCount: mainProductList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = mainProductList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            index: index,
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors
                              .grayscale0, // Background color for the container
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Image on the left side
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(product.imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // Details on the right side
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productName,
                                      style: AppFonts.caption1(
                                          color: AppColors.grayscale100),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${product.boughtPastMonth}+ Bought Past Month',
                                      style: AppFonts.caption2(
                                          color: AppColors.grayscale90),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        // List of five stars
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) {
                                              if (index <
                                                  product.rating.floor()) {
                                                // Full star
                                                return const Icon(
                                                  Icons.star,
                                                  color: AppColors.secondary50,
                                                );
                                              } else if (index <
                                                  product.rating) {
                                                // Half-filled star
                                                return const Icon(
                                                  Icons.star_half,
                                                  color: AppColors.secondary50,
                                                );
                                              } else {
                                                // Empty star
                                                return const Icon(
                                                  Icons.star_border,
                                                  color: AppColors.secondary50,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          product.rating.toString(),
                                          style: AppFonts.caption2(
                                            color: AppColors.grayscale90,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          product.discountedPrice,
                                          style: AppFonts.headline3(
                                              color: AppColors.primary40),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          product.actualPrice,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.grayscale50,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        const Spacer(),
                                        Text(
                                          '(${calculateDiscountPercentage(product.actualPrice, product.discountedPrice)}%) Off',
                                          style: AppFonts.caption1(
                                              color: AppColors.grayscale100),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
      floatingActionButton: IntrinsicWidth(
        child: Container(
          height: 40,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.grayscale20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) {
                      _quantity--; // Decrease quantity by 1
                    }
                    if (_quantity <= 1) {
// Show initial button
                    }
                  });
                },
              ),
              Text(
                _quantity.toString(),
                style: AppFonts.body1(color: AppColors.grayscale90),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.secondary30,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Add To Cart',
                      style: AppFonts.body1(color: AppColors.grayscale90),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutPage(
                            totalAmount: totalFinalAmount,
                            totalDiscount: totaldiscount,
                            totalGrossAmount: totalGrossAmount,
                          ),
                        ),
                      );
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
                      'Buy Now',
                      style: AppFonts.body1(color: AppColors.grayscale0),
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
