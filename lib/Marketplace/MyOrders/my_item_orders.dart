import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../Theme/Colors.dart';

import '../ProductMarketplace/ProductMarketplaceWidgets/chips_widget.dart';

import 'my_items_card.dart';

import 'my_order_details.dart';

class MyItemsOrders extends StatefulWidget {
  const MyItemsOrders({super.key});

  @override
  State<MyItemsOrders> createState() => _MyItemsOrdersState();
}

class _MyItemsOrdersState extends State<MyItemsOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale0,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                    myitemordersfilter.length,
                    (index) => ChipsWidget(
                      label: myitemordersfilter[index],
                      onTap: () {
                        // Do something when the chip is tapped
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myitemorders.length,
              itemBuilder: (context, index) {
                final order = myitemorders[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyOrderDetails(
                                status: order.status,
                                itemImages: order.itemImages,
                                itemNames: order.itemNames,
                                itemPrice: order.itemPrice,
                                numberOfItems: order.numberOfItems,
                                date: order.date,
                                deliverydate: order.deliverydate,
                              )),
                    );
                  },
                  child: MyOrderCard(
                    date: order.date,
                    id: order.id,
                    status: order.status,
                    numberOfItems: order.numberOfItems,
                    itemImages: order.itemImages,
                    deliverydate: order.deliverydate,
                    itemNames: order.itemNames,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
