import 'package:flutter/material.dart';
import 'package:hathera_demo/DriverApp/DriverAcceptedOrders/driver_acceptedorder_details.dart';
import 'package:hathera_demo/DriverApp/DriverAppDummyData/driver_order_list.dart';
import 'package:hathera_demo/DriverApp/DriverAppWidgets/driver_order_status_chip_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../DriverAppWidgets/new_orders_filter_modal.dart';

class DriverAcceptedOrders extends StatefulWidget {
  const DriverAcceptedOrders({Key? key}) : super(key: key);

  @override
  State<DriverAcceptedOrders> createState() => _DriverAcceptedOrdersState();
}

class _DriverAcceptedOrdersState extends State<DriverAcceptedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      radius: Radius.circular(20),
      thickness: 3,
      child: SingleChildScrollView(
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
                      onTap: () {},
                      child: Row(
                        children: [
                          InkWell(
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
                                    child: FilterNewOrdersModal(
                                      showPaymentStatusFilter: false,
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              Icons.filter_list,
                              size: 20,
                              color: AppColors.primary50,
                            ),
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
                                                size: 20,
                                                Icons.person,
                                                color: AppColors.grayscale70,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                acceptedorder.customername,
                                                style: AppFonts.headline4(
                                                    color:
                                                        AppColors.grayscale70),
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
                                            size: 20,
                                            Icons.location_on_outlined,
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
      ),
    );
  }
}
