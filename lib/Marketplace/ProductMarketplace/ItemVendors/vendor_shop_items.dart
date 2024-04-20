import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ItemVendors/vendor_item_animal_category_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../ProductMarketplaceWidgets/chips_widget.dart';
import '../marketplace_items.dart';
import '../product_details_page.dart';
import 'vendor_items_category_widget.dart';

class VendorShopItems extends StatefulWidget {
  final int index;
  const VendorShopItems({super.key, required this.index});

  @override
  State<VendorShopItems> createState() => _VendorShopItemsState();
}

class _VendorShopItemsState extends State<VendorShopItems> {
  String? selectedValue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final vendor = ProductVendorData[widget.index];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        title: Text(
          vendor['name'],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Catalog',
                    style: AppFonts.title5(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_list,
                          size: 20,
                          color: AppColors.primary30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              showDragHandle: true,
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (BuildContext context) {
                                return VendorAnimalCategory();
                              },
                            );
                          },
                          child: Text(
                            'Animal Filter',
                            style: AppFonts.body1(
                              color: AppColors.primary30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: AppColors.grayscale20), // Outline color
                        color: Colors.white, // Background color
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelStyle:
                              AppFonts.body2(color: AppColors.grayscale90),
                          hintText: "Search Item",
                          hintStyle: TextStyle(color: AppColors.grayscale50),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return VendorItemCategory();
                                },
                              );
                            },
                            child: Icon(Icons.keyboard_arrow_down_sharp,
                                color: AppColors.primary30),
                          ),
                          prefixIcon:
                              Icon(Icons.search, color: AppColors.primary30),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 22 / 8,
                      viewportFraction: 1.0,
                      onPageChanged: (index, _) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: productadvertisements.map((ad) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              child: Image.asset(
                                ad,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        productadvertisements.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.primary50
                              : AppColors.grayscale10,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                    filteredCatalogChipsList.length,
                    (index) => ChipsWidget(
                      label: filteredCatalogChipsList[index],
                      onTap: () {
                        // Do something when the chip is tapped
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.3, // Adjust aspect ratio as needed
                ),
                itemCount: filteredProductList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = filteredProductList[index];
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
                                  borderRadius: BorderRadius.only(
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
                                                return Icon(
                                                  Icons.star,
                                                  color: AppColors.secondary50,
                                                );
                                              } else if (index <
                                                  product.rating) {
                                                // Half-filled star
                                                return Icon(
                                                  Icons.star_half,
                                                  color: AppColors.secondary50,
                                                );
                                              } else {
                                                // Empty star
                                                return Icon(
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
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.grayscale50,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        Spacer(),
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
    );
  }
}
