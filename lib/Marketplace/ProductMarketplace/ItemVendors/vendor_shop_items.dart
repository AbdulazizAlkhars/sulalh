import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ItemVendors/vendor_item_animal_category_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../Cart.dart';
import '../ProductMarketplaceWidgets/chips_widget.dart';
import '../ProductMarketplaceWidgets/product_onegrid_widget.dart';
import '../ProductMarketplaceWidgets/searchable_dropdown_widget.dart';
import '../ProductMarketplaceWidgets/select_your_animal_modal.dart';
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
              Row(
                children: [
                  Text(
                    'Catalog',
                    style: AppFonts.title5(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  const Spacer(),
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
                                return const VendorItemCategory();
                              },
                            );
                          },
                          child: Text(
                            'Categories',
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
              const SearchableDropdown(),
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
