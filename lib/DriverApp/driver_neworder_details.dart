import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/DriverApp/driver_order_list.dart';

import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';
import 'driver_order_status_chip_widget.dart'; // Import your order model if needed

class OrderDetailsPage extends StatelessWidget {
  final DriverNewOrders
      order; // Replace 'Order' with your order model if needed

  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Order Number: ${order.ordernumber}',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.white,
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '100 KWD',
                      style: AppFonts.title3(
                        color: AppColors.grayscale90,
                      ),
                    ),
                    Text(
                      'Paid',
                      style: AppFonts.title5(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Card(
              color: Colors.white,
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery',
                          style: AppFonts.title4(
                            color: AppColors.grayscale90,
                          ),
                        ),
                        Text(
                          'Time: ${order.deliveryslot}',
                          style: AppFonts.title5(
                            color: AppColors.grayscale70,
                          ),
                        ),
                        Text(
                          '${order.deliverydate}',
                          style: AppFonts.title5(
                            color: AppColors.grayscale70,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Remaining Time',
                          style: AppFonts.title4(
                            color: AppColors.grayscale90,
                          ),
                        ),
                        Text(
                          'Time: ${order.deliveryslot}',
                          style: AppFonts.title5(
                            color: AppColors.grayscale70,
                          ),
                        ),
                        Text(
                          '${order.deliverydate}',
                          style: AppFonts.title5(
                            color: AppColors.grayscale70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppColors.grayscale70,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              order.customername,
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale70),
                            ),
                          ],
                        ),
                        Spacer(),
                        DriverOrderStatusChip(
                          status: order.status,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delivery_dining,
                          color: AppColors.grayscale60,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          order.customeraddress,
                          style:
                              AppFonts.headline4(color: AppColors.grayscale60),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          color: AppColors.grayscale60,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '96721717',
                          style:
                              AppFonts.headline4(color: AppColors.grayscale60),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.grayscale60,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            '18059 Po Box, Subhan Industrial Area, Kuwait',
                            style: AppFonts.headline4(
                                color: AppColors.grayscale60),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.home,
                          color: AppColors.grayscale60,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            'Driver',
                            style: AppFonts.headline4(
                                color: AppColors.grayscale60),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text('Order Number: ${order.ordernumber}'),
            Text('Customer Name: ${order.customername}'),
            Text('Delivery Address: ${order.customeraddress}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
