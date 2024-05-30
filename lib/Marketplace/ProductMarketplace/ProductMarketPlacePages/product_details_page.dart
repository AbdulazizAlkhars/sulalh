import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlacePages/Cart.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlaceWidgets/chips_widget.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlaceWidgets/product_twogrids_widget.dart';
import 'package:intl/intl.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../ProductMarketPlaceWidgets/item_promotional_chips_widget.dart';
import '../ProductMarketPlaceWidgets/rating_summary_widget.dart';
import '../ProductMarketplaceWidgets/auto_delivery_widget.dart';
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
  bool isSelected = false;
  String selectedPeriod = "Select Period";

  // List of months
  final List<String> autoDeliveryPeriod = [
    '15 Days',
    '1 Month',
    '2 Months',
    '3 Months',
  ];
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
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.width * 0.09,
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
        actions: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grayscale0,
                  ),
                  child: const Icon(
                    Icons.share_outlined,
                    color: AppColors.primary50,
                    size: 20,
                  ),
                ),
                onPressed:
                    () {}, // Call the addAnimal function when the button is pressed
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary50,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                }, // Call the addAnimal function when the button is pressed
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Scrollbar(
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Stack(
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
                    Positioned(
                      top: 5,
                      left: 60,
                      child: ItemPromotionalChipsWidget(
                          promotiontag: widget.product.promotiontag,
                          textStyle: AppFonts.body2(color: AppColors.error100)),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage(widget.product.forwhatspecies),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Text(
                        '(${calculateDiscountPercentage(widget.product.actualPrice, widget.product.discountedPrice)}%) Off',
                        style:
                            AppFonts.headline4(color: AppColors.grayscale100),
                      ),
                    ),
                  ],
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
                Divider(
                  color: AppColors.grayscale10,
                ),
                // Product details text here...
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        widget.product.productName, // Replace with product name
                        style: AppFonts.title5(color: AppColors.grayscale90),
                        softWrap: true, // Enable text wrapping
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.product.weightvoulme,
                          style: AppFonts.title5(color: AppColors.primary30),
                        ),
                        Visibility(
                          visible: widget.product.pcsperpack.isNotEmpty,
                          child: Row(
                            children: [
                              Text(
                                ' / ',
                                style:
                                    AppFonts.title5(color: AppColors.primary30),
                              ),
                              Text(
                                widget.product.pcsperpack,
                                style:
                                    AppFonts.title5(color: AppColors.primary30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.product.discountedPrice,
                            style: AppFonts.title4(color: AppColors.primary40)),
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
                  ],
                ),
                const SizedBox(height: 10),
                AutoDeliveryWidget(),

                const SizedBox(height: 10),
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
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.secondary10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                widget.product.rating
                                                    .toString(),
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
                                                        color: AppColors
                                                            .secondary50,
                                                      );
                                                    } else if (index <
                                                        widget.product.rating) {
                                                      // Half-filled star
                                                      return const Icon(
                                                        Icons.star_half,
                                                        size: 20,
                                                        color: AppColors
                                                            .secondary50,
                                                      );
                                                    } else {
                                                      // Empty star
                                                      return const Icon(
                                                        Icons.star_border,
                                                        size: 20,
                                                        color: AppColors
                                                            .secondary50,
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.secondary10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Align content vertically at center
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                      'assets/Marketplace/Frame 2087325740 5.png',
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // Add spacing between avatar and name
                                  Text(
                                    widget.product.shopName,
                                    style: const TextStyle(
                                      color: AppColors.grayscale90,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(), // Add spacer to push icon to the right
                                  const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.primary20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Benefits', // Replace with actual name
                      style: AppFonts.headline2(color: AppColors.grayscale90),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.product.benefits,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Description', // Replace with actual name
                      style: AppFonts.headline2(color: AppColors.grayscale90),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.product.description,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                    Divider(
                      color: AppColors.grayscale10,
                    ),
                    const SizedBox(height: 10),
                    RatingSummaryWidget(reviews: reviews),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Reviews',
                            style:
                                AppFonts.title4(color: AppColors.grayscale90),
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
                                          size: 20,
                                          color: AppColors.secondary50),
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
                                style: AppFonts.body2(
                                    color: AppColors.grayscale90),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.grayscale10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Similar Products For Tommy ',
                        style: AppFonts.title5(color: AppColors.grayscale90),
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
                ProductTwoGridsWidget(mainProductList: similarProductList)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: IntrinsicWidth(
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 40,
            width: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.grayscale0,
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
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColors.grayscale20),
            color: AppColors.grayscale00,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.secondary50,
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
