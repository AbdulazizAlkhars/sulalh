import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../ProductMarketplace/ProductMarketplaceWidgets/checkout_cart_items_widget.dart';
import '../ProductMarketplace/ProductMarketplaceWidgets/chips_widget.dart';
import '../ProductMarketplace/product_details_page.dart';
import 'my_items_card.dart';
import 'my_orders.dart';

class MyItemsOrders extends StatefulWidget {
  const MyItemsOrders({super.key});

  @override
  State<MyItemsOrders> createState() => _MyItemsOrdersState();
}

class _MyItemsOrdersState extends State<MyItemsOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      label: myitemordersfilter[index],
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myitemorders.length,
                itemBuilder: (context, index) {
                  final order = myitemorders[index];
                  return MyOrderCard(
                    date: order.date,
                    id: order.id,
                    status: order.status,
                    numberOfItems: order.numberOfItems,
                    itemImages: order.itemImages,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
