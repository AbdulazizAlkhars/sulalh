import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ItemVendors/item_vendors.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/select_your_animal_modal.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Lists.dart';
import 'Cart.dart';
import 'ItemVendors/vendor_shop_details.dart';
import 'ProductMarketplaceWidgets/change_address_modal_sheet.dart';
import 'ProductMarketplaceWidgets/filter_items_widget.dart';
import 'ProductMarketplaceWidgets/product_twogrids_widget.dart';
import 'ProductMarketplaceWidgets/searchable_dropdown_widget.dart';
import 'filtered_item_catalog.dart';

import 'ProductMarketplaceWidgets/vendors_avatars_widget.dart';

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
          Row(
            children: [
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
                    Icons.person_outline_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                onPressed:
                    () {}, // Call the signin function when the button is pressed
              ),
            ],
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
                  size: 20,
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
            Container(
              decoration: BoxDecoration(
                color: AppColors.grayscale0,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.8, // Adjust height as needed
                          child: const SelectYourAnimalModal());
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Animal',
                        style: AppFonts.title4(color: AppColors.grayscale90),
                      ),
                      const SizedBox(height: 13),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.044,
                            backgroundImage: const AssetImage(
                                'assets/avatars/120px/Dog.png'),
                          ),
                          const SizedBox(width: 8.0),
                          // ignore: unnecessary_const
                          const Text(
                            'Tommy',
                            style: TextStyle(fontSize: 14),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.primary50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 13),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grayscale0,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Category Filters',
                            style:
                                AppFonts.title4(color: AppColors.grayscale90),
                          ),
                        ),
                      ],
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
                                    builder: (context) =>
                                        const FilteredItemCatalog()),
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
                                      backgroundColor: AppColors.grayscale00,
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

                                        textAlign: TextAlign
                                            .center, // Center align text
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
                  ],
                ),
              ),
            ),

            const SizedBox(height: 13),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grayscale0,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Top Vendors',
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
                                  builder: (context) =>
                                      VendorShopDetails(index: index),
                                ),
                              );
                            },
                            child: ProductVendorAvatars(
                              imageAsset: ProductVendorData[index]
                                  ['imageAsset'],
                              name: ProductVendorData[index]['name'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
            const SizedBox(
              height: 15,
            ),
            Divider(
              color: AppColors.grayscale10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Catalog',
                    style: AppFonts.title4(
                      color: AppColors.grayscale90,
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Previously Bought',
                        style: AppFonts.title5(color: AppColors.grayscale90)),
                  ),
                  Expanded(
                    flex: 0,
                    child: GestureDetector(
                      onTap: () {
                        showFilterItemBottomSheet(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            color: AppColors.primary50,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Filters',
                            style: AppFonts.body1(color: AppColors.primary40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProductTwoGridsWidget(
              mainProductList: mainProductList,
            ),
            Divider(
              color: AppColors.grayscale10,
            ),
            const SizedBox(height: 15),

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Recommended Products',
                        style: AppFonts.title5(color: AppColors.grayscale90)),
                  ),
                  Expanded(
                    flex: 0,
                    child: GestureDetector(
                      onTap: () {
                        showFilterItemBottomSheet(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            color: AppColors.primary50,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Filters',
                            style: AppFonts.body1(color: AppColors.primary40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProductTwoGridsWidget(
              mainProductList: mainProductList,
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
