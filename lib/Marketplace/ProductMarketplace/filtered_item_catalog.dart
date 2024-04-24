import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import 'ProductMarketplaceWidgets/chips_widget.dart';
import 'ProductMarketplaceWidgets/filter_items_widget.dart';
import 'ProductMarketplaceWidgets/item_promotional_chips_widget.dart';
import 'ProductMarketplaceWidgets/searchable_dropdown_widget.dart';
import 'ProductMarketplaceWidgets/select_your_animal_modal.dart';
import 'marketplace_items.dart';
import 'product_details_page.dart';

class FilteredItemCatalog extends StatefulWidget {
  const FilteredItemCatalog({super.key});

  @override
  State<FilteredItemCatalog> createState() => _FilteredItemCatalogState();
}

class _FilteredItemCatalogState extends State<FilteredItemCatalog> {
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
            icon: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              showFilterItemBottomSheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
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
              Text(
                'Catalog',
                style: AppFonts.title5(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01),
                child: SearchableDropdown(),
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
                  childAspectRatio: 2.2, // Adjust aspect ratio as needed
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
                              .grayscale10, // Background color for the container
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    color: Colors.white),
                                child: Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                            image:
                                                AssetImage(product.imagePath),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      ItemPromotionalChipsWidget(
                                        promotiontag: product.promotiontag,
                                      )
                                    ],
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
                                    Row(
                                      children: [
                                        // Product name
                                        Expanded(
                                          child: Text(
                                            product.productName,
                                            style: AppFonts.caption1(
                                              color: AppColors.grayscale100,
                                            ),
                                          ),
                                        ),
                                        // List of tags
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${product.boughtPastMonth}+ Bought Past Month',
                                      style: AppFonts.caption2(
                                        color: AppColors.grayscale90,
                                      ),
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
                                            color: AppColors.primary40,
                                          ),
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
                                            color: AppColors.grayscale100,
                                          ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
