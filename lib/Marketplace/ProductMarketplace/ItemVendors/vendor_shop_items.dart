// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/brands_modal_sheet_widget.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/filter_items_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../Cart.dart';
import '../ProductMarketplaceWidgets/chips_widget.dart';
import '../ProductMarketplaceWidgets/column_product_card_widget.dart';
import '../ProductMarketplaceWidgets/product_onegrid_widget.dart';
import '../ProductMarketplaceWidgets/scrollable_product_cards_widget.dart';
import '../ProductMarketplaceWidgets/searchable_dropdown_widget.dart';
import '../ProductMarketplaceWidgets/select_your_animal_modal.dart';

class VendorShopItems extends StatefulWidget {
  final int index;
  List<String>? subcategories;
  String? categoryName;
  VendorShopItems({
    super.key,
    required this.index,
    this.categoryName,
    this.subcategories,
  });

  @override
  State<VendorShopItems> createState() => _VendorShopItemsState();
}

class _VendorShopItemsState extends State<VendorShopItems> {
  String? selectedValue;
  String selectedCategoryName = '';
  int selectedIndex = -1;

  void updateSubcategories(String categoryName) {
    setState(() {
      selectedCategoryName = categoryName;
      if (categoryDetails.containsKey(categoryName)) {
        widget.subcategories =
            List<String>.from(categoryDetails[categoryName]!['subcategories']);
      } else {
        widget.subcategories = [];
      }
    });
  }

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
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grayscale00,
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
                            child: Text('Categories',
                                style: AppFonts.title5(
                                    color: AppColors.grayscale90)),
                          ),
                          GestureDetector(
                            onTap: () {
                              showFilterItemBottomSheet(context);
                            },
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
                      // const SizedBox(height: 13),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categoryDetails.entries.map((entry) {
                            final categoryName = entry.key;
                            final iconData = entry.value['icon'];
                            final index = categoryDetails.keys
                                .toList()
                                .indexOf(categoryName);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  updateSubcategories(categoryName);
                                });
                              },
                              child: SizedBox(
                                height: 120,
                                width: 75,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
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

                                        textAlign: TextAlign
                                            .center, // Center align text
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
                ),
              ),
              Divider(
                color: AppColors.grayscale10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  selectedCategoryName.isNotEmpty
                      ? Expanded(
                          child: Text('$selectedCategoryName For Tommy ',
                              style: AppFonts.title5(
                                  color: AppColors.grayscale90)),
                        )
                      : Expanded(
                          child: Text('All Products For Tommy',
                              style: AppFonts.title5(
                                  color: AppColors.grayscale90)),
                        ),
                  GestureDetector(
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
                              child: const BrandsModal());
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rate_outlined,
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
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              builder: (BuildContext context) {
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8, // Adjust height as needed
                                    child: const BrandsModal());
                              },
                            );
                          },
                          child: Text(
                            'Brands',
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
              Scrollbar(
                thickness: BorderSide.strokeAlignInside,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(
                        widget.subcategories != null
                            ? widget.subcategories!.length
                            : 0,
                        (index) => ChipsWidget(
                          label: widget.subcategories![index],
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ProductOneGridWidget(
                mainProductList: topProductList,
              ),
              Divider(
                color: AppColors.grayscale10,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Best Deals For Tommy ',
                          style: AppFonts.title5(color: AppColors.grayscale90)),
                    ),
                    GestureDetector(
                      onTap: () {
                        showFilterItemBottomSheet(context);
                      },
                      child: Text(
                        'See More',
                        style: AppFonts.body1(color: AppColors.primary40),
                      ),
                    ),
                  ],
                ),
              ),
              ScrollableProductCardsWidget(
                mainProductList: prevouslyBoughtProductList,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
