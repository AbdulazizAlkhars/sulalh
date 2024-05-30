import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/Lists.dart';

import '../../Theme/Colors.dart';

import '../ProductMarketplace/ProductMarketPlaceWidgets/chips_widget.dart';
import 'auto_delivery_item_card.dart';

class AutoDeliveryItemsList extends StatefulWidget {
  const AutoDeliveryItemsList({super.key});

  @override
  State<AutoDeliveryItemsList> createState() => _AutoDeliveryItemsListState();
}

class _AutoDeliveryItemsListState extends State<AutoDeliveryItemsList> {
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
              child: Scrollbar(
                thickness: BorderSide.strokeAlignInside,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: autoDeliveryOrder.length,
              itemBuilder: (context, index) {
                final order = autoDeliveryOrder[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => MyOrderDetails(
                    //             status: order.status,
                    //             itemImages: order.itemImages,
                    //             itemNames: order.itemNames,
                    //             itemPrice: order.itemPrice,
                    //             numberOfItems: order.numberOfItems,
                    //             date: order.date,
                    //             deliverydate: order.deliverydate,
                    //           )),
                    // );
                  },
                  child: AutoDeliveryItemCard(
                    date: order.date,
                    id: order.id,
                    numberOfItems: order.numberOfItems,
                    autoDeliveryItemImages: order.autoDeliveryItemImages,
                    deliverydate: order.nextdeliverydate,
                    itemNames: order.autoDeliveryItemNames,
                    itemPrice: order.itemPrice,
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
