import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/marketplace_items.dart';

import 'package:hathera_demo/Marketplace/AnimalMarketPlace/marketplace_animals.dart';

import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

import 'ProductMarketplace/Cart.dart';
import 'ProductMarketplace/ProductMarketplaceWidgets/change_address_modal_sheet.dart';

// ignore: must_be_immutable
class Marketplacehomepage extends ConsumerStatefulWidget {
  Marketplacehomepage({
    super.key,
  });

  @override
  ConsumerState<Marketplacehomepage> createState() => _Marketplacehomepage();
}

class _Marketplacehomepage extends ConsumerState<Marketplacehomepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String filterQuery = '';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    // Filter the OviAnimals list based on the filterQuery

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Marketplace'.tr,
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
                  Icons.chat_bubble_outline_outlined,
                  color: Colors.black,
                )),
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
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.029,
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: AppColors.grayscale20), // Outline color
                        color: Colors.white, // Background color
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: AppColors
                                  .grayscale50), // Change hint text color
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(24),
                ),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.transparent,
                labelColor: AppColors.grayscale0,
                unselectedLabelColor: AppColors.grayscale60,
                labelStyle: AppFonts.body2(color: AppColors.grayscale0),
                tabs: const [
                  Tab(
                    text: 'Animals',
                  ),
                  Tab(
                    text: 'Items',
                  ),
                  Tab(
                    text: 'Services',
                  ),
                  Tab(
                    text: 'Sell',
                  ),
                ],
              ),
            ),

            // Tab Bar View
            // Tab Bar View
            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const MarketplaceAnimal(),
                  const MarketplaceItems(),
                  Container(
                    color: Colors
                        .blue, // Placeholder color for Medical Notes tab view
                  ),
                  Container(
                    color: Colors
                        .red, // Placeholder color for Medical Notes tab view
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Tab Bar
  }
}
