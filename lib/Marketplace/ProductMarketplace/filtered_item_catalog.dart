import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import 'ProductMarketplaceWidgets/chips_widget.dart';
import 'ProductMarketplaceWidgets/filter_items_widget.dart';
import 'ProductMarketplaceWidgets/item_promotional_chips_widget.dart';
import 'ProductMarketplaceWidgets/product_onegrid_widget.dart';
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
