import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ItemVendors/item_vendors.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Lists.dart';
import 'Cart.dart';
import 'ItemVendors/vendor_shop_details.dart';
import 'ProductMarketplaceWidgets/change_address_modal_sheet.dart';
import 'ProductMarketplaceWidgets/searchable_dropdown_widget.dart';
import 'filtered_item_catalog.dart';
import 'item_category.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        title: Text(
          'Sulala Market',
          style: AppFonts.title3(color: AppColors.grayscale90),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grayscale10,
              ),
              child: const Icon(
                Icons.login_outlined,
                color: Colors.black,
              ),
            ),
            onPressed:
                () {}, // Call the addAnimal function when the button is pressed
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary50,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 25,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }, // Call the addAnimal function when the button is pressed
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15), // Add spacing between the boxes

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) {
                        return const ChangeAddressModal();
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary50,
                      ),
                      SizedBox(width: 8.0),
                      // ignore: unnecessary_const
                      const Expanded(
                          child: Text(
                        '10559 RAS AL KHAIMA, RAS AL KHAIMA',
                        style: TextStyle(fontSize: 14),
                      )),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primary50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01,
                  right: MediaQuery.of(context).size.width * 0.01),
              child: const SearchableDropdown(),
            ),
            const SizedBox(
              height: 20,
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
                    child: Text(
                      'Category Filters',
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
                              builder: (context) => ItemVendors()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Swipe',
                            style: AppFonts.body1(color: AppColors.primary40),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.east_sharp,
                            color: AppColors.primary40,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryIcons.entries.map((entry) {
                  final categoryName = entry.key;
                  final iconData = entry.value;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilteredItemCatalog()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1.0), // Adjust horizontal padding
                      child: SizedBox(
                        height: 100,

                        width: 100, // Set fixed width for each item
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.grayscale10,
                              radius: 30,
                              child: Icon(
                                iconData,
                                size: 30,
                                color: AppColors.primary30,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              child: Text(
                                categoryName,
                                style: const TextStyle(fontSize: 12),

                                textAlign:
                                    TextAlign.center, // Center align text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Top Vendors',
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
                              builder: (context) => ItemVendors()),
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
                    child: ProductVendorAvatars(
                      imageAsset: ProductVendorData[index]['imageAsset'],
                      name: ProductVendorData[index]['name'],
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 2,
            //         child: Text('Community Help',
            //             style: AppFonts.title4(color: AppColors.grayscale90)),
            //       ),
            //       Expanded(
            //         flex: 0,
            //         child: TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             'View All',
            //             style: AppFonts.body1(color: AppColors.primary40),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List.generate(
            //       CharityOrgData.length,
            //       (index) => CommunityAvatars(
            //         imageAsset: CharityOrgData[index]['imageAsset'],
            //         name: CharityOrgData[index]['name'],
            //       ),
            //     ),
            //   ),
            // ),
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
                                            } else if (index < product.rating) {
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
    );
  }
}

double calculateDiscountPercentage(String actualPrice, String discountedPrice) {
  double actual = double.parse(actualPrice.replaceAll('\$', ''));
  double discounted = double.parse(discountedPrice.replaceAll('\$', ''));
  double discount = (actual - discounted) / actual * 100;
  return discount.round().toDouble();
}
