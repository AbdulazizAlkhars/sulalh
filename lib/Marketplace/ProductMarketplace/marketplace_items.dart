import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ItemVendors/item_vendors.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Lists.dart';
import 'ItemVendors/vendor_shop_details.dart';
import 'item_category.dart';
import 'ProductMarketplaceWidgets/community_avatars_widget.dart';

import 'product_details_page.dart';
import 'vendors_avatars_widget.dart';

class MarketplaceItems extends StatefulWidget {
  const MarketplaceItems({Key? key}) : super(key: key);

  @override
  State<MarketplaceItems> createState() => _MarketplaceItemsState();
}

class _MarketplaceItemsState extends State<MarketplaceItems> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15), // Add spacing between the boxes

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
                children: productadvertisements.asMap().entries.map((entry) {
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
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Top Vendors',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItemVendors()),
                      );
                    },
                    child: Text(
                      'View All',
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                ProductVendorData.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VendorShopDetails(index: index),
                      ),
                    );
                  },
                  child: AnimalVendorAvatars(
                    imageAsset: ProductVendorData[index]['imageAsset'],
                    name: ProductVendorData[index]['name'],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Community Help',
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
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                CharityOrgData.length,
                (index) => CommunityAvatars(
                  imageAsset: CharityOrgData[index]['imageAsset'],
                  name: CharityOrgData[index]['name'],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Catalog',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        color: AppColors.primary50,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetItemCategories()),
                          );
                        },
                        child: Text(
                          'Filters',
                          style: AppFonts.body1(color: AppColors.primary40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.7, // Adjust aspect ratio as needed
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
                                          if (index < product.rating.floor()) {
                                            // Full star
                                            return Icon(
                                              Icons.star,
                                              color: AppColors.secondary50,
                                            );
                                          } else if (index < product.rating) {
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        decoration: TextDecoration.lineThrough,
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
    );
  }
}

double calculateDiscountPercentage(String actualPrice, String discountedPrice) {
  double actual = double.parse(actualPrice.replaceAll('\$', ''));
  double discounted = double.parse(discountedPrice.replaceAll('\$', ''));
  double discount = (actual - discounted) / actual * 100;
  return discount.round().toDouble();
}
