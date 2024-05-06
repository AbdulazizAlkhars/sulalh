import 'package:flutter/material.dart';

import 'package:hathera_demo/DriverApp/DriverDeliveredOrders/driver_delivered_order_details.dart';
import 'package:hathera_demo/DriverApp/DriverAppDummyData/driver_order_list.dart';
import 'package:hathera_demo/DriverApp/DriverAppWidgets/driver_order_status_chip_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

import '../DriverAppWidgets/new_orders_filter_modal.dart';

class DriverDeliveredOrders extends StatefulWidget {
  const DriverDeliveredOrders({Key? key}) : super(key: key);

  @override
  State<DriverDeliveredOrders> createState() => _DriverDeliveredOrdersState();
}

class _DriverDeliveredOrdersState extends State<DriverDeliveredOrders> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      radius: const Radius.circular(20),
      thickness: 3,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Delivered Orders',
                        style: AppFonts.title4(color: AppColors.grayscale90)),
                  ),
                  Expanded(
                    flex: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          showDragHandle: true,
                          isScrollControlled:
                              true, // Set to true to allow the bottom sheet to occupy full screen height
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.8, // Adjust height as needed
                              child: const FilterNewOrdersModal(
                                showPaymentStatusFilter: true,
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            size: 20,
                            color: AppColors.primary30,
                          ),
                          Text(
                            'Filters',
                            style: AppFonts.body1(color: AppColors.primary30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2, // Adjust aspect ratio as needed
              ),
              itemCount: DriverDeliveredOrdersList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final deliveredorder = DriverDeliveredOrdersList[index];
                double totalCartSum = deliveredorder.cartItems.fold(
                    0,
                    (prev, cartItem) =>
                        prev + (cartItem.price * cartItem.quantity));
                Color paymentStatusColor =
                    deliveredorder.paymentStatus == 'Paid'
                        ? AppColors.primary30
                        : AppColors.error100;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DriverDeliveredOrdersDetails(order: deliveredorder),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: AppColors.grayscale20),
                        color: AppColors.grayscale00,
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
                                        '\KWD ${totalCartSum.toStringAsFixed(2)}',
                                        style: AppFonts.title4(
                                            color: paymentStatusColor),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        deliveredorder.paymentStatus,
                                        style: AppFonts.caption1(
                                            color: paymentStatusColor),
                                      ),
                                      const Spacer(),
                                      Text(
                                        deliveredorder.deliverydate,
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
                                                size: 20,
                                                Icons.person,
                                                color: AppColors.grayscale70,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                deliveredorder.customername,
                                                style: AppFonts.headline4(
                                                    color:
                                                        AppColors.grayscale70),
                                              ),
                                              const SizedBox(width: 3),
                                            ],
                                          ),
                                          const Spacer(),
                                          DriverOrderStatusChip(
                                            status: deliveredorder.status,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            size: 20,
                                            Icons.location_on_outlined,
                                            color: AppColors.grayscale60,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            deliveredorder.customeraddress,
                                            style: AppFonts.headline4(
                                                color: AppColors.grayscale60),
                                          ),
                                          const SizedBox(width: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 3),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        deliveredorder.shopname,
                                        style: AppFonts.headline3(
                                            color: AppColors.grayscale90),
                                      ),
                                      const Spacer(),
                                      Text(
                                        deliveredorder.ordernumber,
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
      ),
    );
  }
}
