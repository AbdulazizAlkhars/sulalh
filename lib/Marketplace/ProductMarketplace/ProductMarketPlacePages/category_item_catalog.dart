import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import 'Cart.dart';
import '../ProductMarketPlaceWidgets/chips_widget.dart';
import '../ProductMarketPlaceWidgets/filter_items_widget.dart';
import '../ProductMarketPlaceWidgets/product_onegrid_widget.dart';
import '../ProductMarketPlaceWidgets/scrollable_product_cards_widget.dart';
import '../ProductMarketPlaceWidgets/searchable_dropdown_widget.dart';
import '../ProductMarketPlaceWidgets/select_your_animal_modal.dart';

class FilteredItemCatalog extends StatefulWidget {
  final List<String> subcategories;
  final String categoryName;
  const FilteredItemCatalog(
      {super.key, required this.categoryName, required this.subcategories});

  @override
  State<FilteredItemCatalog> createState() => _FilteredItemCatalogState();
}

class _FilteredItemCatalogState extends State<FilteredItemCatalog> {
  int _currentIndex = 0;
  String selectedCategoryName = '';
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        title: Text(
          'Pet Food & Treats',
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
      body: Scrollbar(
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 13),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grayscale00,
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
                              radius: MediaQuery.of(context).size.width * 0.040,
                              backgroundImage: const AssetImage(
                                  'assets/avatars/120px/Dog.png'),
                            ),
                            const SizedBox(width: 8.0),
                            // ignore: unnecessary_const
                            Text(
                              'Tommy',
                              style:
                                  AppFonts.body1(color: AppColors.grayscale90),
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
                  height: 10,
                ),
                const SearchableDropdown(),
                const SizedBox(
                  height: 10,
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
                          widget.subcategories.length,
                          (index) => ChipsWidget(
                            label: widget.subcategories[index].tr,
                            onTap: () {
                              // Add action for each chip tap here, if needed
                              debugPrint(
                                  'Tapped on ${widget.subcategories[index]}');
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Top Product For Tommy',
                            style:
                                AppFonts.title5(color: AppColors.grayscale90)),
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
                    ],
                  ),
                ),
                ProductOneGridWidget(
                  mainProductList: topProductList,
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  color: AppColors.grayscale10,
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20), // Rounded corners
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Best Deals For Tommy',
                            style:
                                AppFonts.title5(color: AppColors.grayscale90)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
