import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/filter_items_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../Cart.dart';
import '../ProductMarketplaceWidgets/chips_widget.dart';
import '../ProductMarketplaceWidgets/product_onegrid_widget.dart';
import '../ProductMarketplaceWidgets/searchable_dropdown_widget.dart';
import '../ProductMarketplaceWidgets/select_your_animal_modal.dart';

class VendorShopItems extends StatefulWidget {
  final int index;
  const VendorShopItems({super.key, required this.index});

  @override
  State<VendorShopItems> createState() => _VendorShopItemsState();
}

class _VendorShopItemsState extends State<VendorShopItems> {
  String? selectedValue;
  String selectedCategoryName = '';
  int selectedIndex = -1;
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
        actions: [
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.grayscale0,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Animal',
                        style: AppFonts.title5(color: AppColors.grayscale90),
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

              const SizedBox(
                height: 15,
              ),
              const SearchableDropdown(),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Category Filters',
                            style:
                                AppFonts.title5(color: AppColors.grayscale90)),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 13),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categoryIcons.entries.map((entry) {
                        final categoryName = entry.key;
                        final iconData = entry.value;
                        final index =
                            categoryIcons.keys.toList().indexOf(categoryName);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              selectedCategoryName = categoryName;
                            });
                          },
                          child: SizedBox(
                            height: 120,
                            width: 100, // Set fixed width for each item
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: selectedIndex == index
                                            ? AppColors.primary20
                                                .withOpacity(0.5)
                                            : Colors.transparent,
                                        spreadRadius: 5,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.grayscale0,
                                    radius: 30,
                                    child: Icon(
                                      iconData,
                                      size: 30,
                                      color: AppColors.primary30,
                                    ),
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
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              // Stack(
              //   alignment: Alignment.bottomCenter,
              //   children: [
              //     CarouselSlider(
              //       options: CarouselOptions(
              //         autoPlay: true,
              //         aspectRatio: 22 / 8,
              //         viewportFraction: 1.0,
              //         onPageChanged: (index, _) {
              //           setState(() {
              //             _currentIndex = index;
              //           });
              //         },
              //       ),
              //       items: productadvertisements.map((ad) {
              //         return Builder(
              //           builder: (BuildContext context) {
              //             return Container(
              //               width: MediaQuery.of(context).size.width,
              //               margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //               child: ClipRRect(
              //                 borderRadius:
              //                     BorderRadius.circular(20), // Rounded corners
              //                 child: Image.asset(
              //                   ad,
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             );
              //           },
              //         );
              //       }).toList(),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children:
              //           productadvertisements.asMap().entries.map((entry) {
              //         int index = entry.key;
              //         return Container(
              //           width: 8.0,
              //           height: 8.0,
              //           margin: const EdgeInsets.symmetric(
              //               vertical: 10.0, horizontal: 2.0),
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: _currentIndex == index
              //                 ? AppColors.primary50
              //                 : AppColors.grayscale10,
              //           ),
              //         );
              //       }).toList(),
              //     ),
              //   ],
              // ),

              Divider(
                color: AppColors.grayscale10,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Catalog',
                  style: AppFonts.title4(
                    color: AppColors.grayscale90,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  selectedCategoryName.isNotEmpty
                      ? Text(selectedCategoryName,
                          style: AppFonts.title5(color: AppColors.grayscale90))
                      : Text('All Products',
                          style: AppFonts.title5(color: AppColors.grayscale90)),
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
                            showFilterItemBottomSheet(context);
                          },
                          child: Text(
                            'Filters',
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
              ProductOneGridWidget(
                mainProductList: mainProductList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
