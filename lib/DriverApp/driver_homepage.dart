import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/DriverApp/driver_customer_support.dart';
import 'package:hathera_demo/DriverApp/DriverNewOrders/driver_new_orders.dart';

import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

import '../Marketplace/ProductMarketplace/Cart.dart';
import 'DriverAcceptedOrders/driver_accepted_orders.dart';
import 'DriverAppWidgets/driver_accounts_modal.dart';
import 'DriverDeliveredOrders/driver_delivered_orders.dart';

// ignore: must_be_immutable
class DriverHomePage extends ConsumerStatefulWidget {
  DriverHomePage({
    super.key,
  });

  @override
  ConsumerState<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends ConsumerState<DriverHomePage>
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
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Sulala Orders'.tr,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            }, // Call the addAnimal function when the button is pressed
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
                  Icons.assignment_ind_outlined,
                  color: Colors.white,
                  size: 25,
                )),
            onPressed: () {
              _showDriverAccounts(context);
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
                    text: 'New Orders',
                  ),
                  Tab(
                    text: 'Accepted',
                  ),
                  Tab(
                    text: 'Delivered',
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
                children: const [
                  DriverNewOrders(),
                  DriverAcceptedOrders(),
                  DriverDeliveredOrders(),
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

void _showDriverAccounts(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return DriverAccountsModal();
    },
  );
}
