import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hathera_demo/DriverApp/driver_acceptedorder_details.dart';
import 'package:hathera_demo/DriverApp/driver_order_list.dart';
import 'package:hathera_demo/DriverApp/driver_order_status_chip_widget.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/product_details_page.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../Marketplace/AnimalMarketPlace/animal_details_page.dart';
import '../Marketplace/Lists.dart';
import '../Marketplace/ProductMarketplace/ItemVendors/vendor_item_animal_category_widget.dart';
import '../Marketplace/ProductMarketplace/ProductMarketplaceWidgets/community_avatars_widget.dart';
import '../Marketplace/ProductMarketplace/marketplace_items.dart';
import '../Marketplace/ProductMarketplace/vendors_avatars_widget.dart';

class DriverAcceptedOrders extends StatefulWidget {
  const DriverAcceptedOrders({Key? key}) : super(key: key);

  @override
  State<DriverAcceptedOrders> createState() => _DriverAcceptedOrdersState();
}

class _DriverAcceptedOrdersState extends State<DriverAcceptedOrders> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Accepted Orders',
                      style: AppFonts.title4(color: AppColors.grayscale90)),
                ),
                Expanded(
                  flex: 0,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext context) {
                          return VendorAnimalCategory();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_list,
                          color: AppColors.primary50,
                        ),
                        Text(
                          'Filters',
                          style: AppFonts.body1(color: AppColors.primary40),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2, // Adjust aspect ratio as needed
            ),
            itemCount: DriverAcceptedOrderList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final acceptedorder = DriverAcceptedOrderList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DriverAcceptedOrderDetails(order: acceptedorder),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors
                          .grayscale0, // Background color for the container
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      acceptedorder.deliveryslot,
                                      style: AppFonts.title4(
                                          color: AppColors.primary50),
                                    ),
                                    Spacer(),
                                    Text(
                                      acceptedorder.deliverydate,
                                      style: AppFonts.headline4(
                                          color: AppColors.grayscale90),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: AppColors.grayscale70,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              acceptedorder.customername,
                                              style: AppFonts.headline4(
                                                  color: AppColors.grayscale70),
                                            ),
                                            const SizedBox(width: 3),
                                          ],
                                        ),
                                        Spacer(),
                                        DriverOrderStatusChip(
                                          status: acceptedorder.status,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.delivery_dining,
                                          color: AppColors.grayscale60,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          acceptedorder.customeraddress,
                                          style: AppFonts.headline4(
                                              color: AppColors.grayscale60),
                                        ),
                                        const SizedBox(width: 3),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 3),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      acceptedorder.shopname,
                                      style: AppFonts.headline3(
                                          color: AppColors.grayscale90),
                                    ),
                                    Spacer(),
                                    Text(
                                      acceptedorder.ordernumber,
                                      style: AppFonts.body1(
                                          color: AppColors.grayscale90),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 3),
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
          ),
        ],
      ),
    );
  }
}
