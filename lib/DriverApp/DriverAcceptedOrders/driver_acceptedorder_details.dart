import 'package:flutter/material.dart';
import 'package:hathera_demo/DriverApp/DriverAppDummyData/driver_order_list.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import '../DriverAppWidgets/driver_cart_items_card_widget.dart';
import '../DriverAppWidgets/driver_order_delivery_time_staus_widget.dart';
// Import your order model if needed

class DriverAcceptedOrderDetails extends StatefulWidget {
  final DriverAcceptedOrders
      order; // Replace 'Order' with your order model if needed

  const DriverAcceptedOrderDetails({Key? key, required this.order})
      : super(key: key);

  @override
  State<DriverAcceptedOrderDetails> createState() =>
      _DriverAcceptedOrderDetailsState();
}

class _DriverAcceptedOrderDetailsState
    extends State<DriverAcceptedOrderDetails> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;

    // Calculate total price
    for (final item in widget.order.cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Order: ${widget.order.ordernumber}',
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
      body: Scrollbar(
        radius: const Radius.circular(20),
        thickness: 4,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: AppColors.grayscale20),
                    color: AppColors.grayscale00,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ' \KWD ${totalPrice.toStringAsFixed(2)}',
                          style: AppFonts.title3(
                            color: AppColors.grayscale90,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: AppColors.grayscale20),
                    color: AppColors.grayscale00,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Delivery',
                              style: AppFonts.title5(
                                color: AppColors.grayscale90,
                              ),
                            ),
                            Text(
                              'Time: ${widget.order.deliveryslot}',
                              style: AppFonts.title5(
                                color: AppColors.grayscale70,
                              ),
                            ),
                            Text(
                              '${widget.order.deliverydate}',
                              style: AppFonts.title5(
                                color: AppColors.grayscale70,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Remaining Time',
                              style: AppFonts.title5(
                                color: AppColors.grayscale90,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: AppColors.grayscale70,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '00:10:39',
                                  style: AppFonts.title5(
                                    color: AppColors.grayscale70,
                                  ),
                                ),
                              ],
                            ),
                            DriverDeliveryTimeStatusChip(
                              status: widget.order.deliverystatus,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: AppColors.grayscale20),
                    color: AppColors.grayscale00,
                  ),
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
                                const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.secondary30),
                                const SizedBox(width: 5),
                                Text(
                                  widget.order.customername,
                                  style: AppFonts.headline3(
                                      color: AppColors.grayscale70),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 20,
                              color: AppColors.grayscale60,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '96721717',
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale60),
                            ),
                            const Spacer(),
                            Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                                side: const BorderSide(
                                    color: Colors
                                        .transparent), // Make outline transparent
                              ),
                              backgroundColor: AppColors.primary40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ), // Adjust padding as needed
                              label: Text(
                                'Call',
                                style: AppFonts.caption1(
                                  color: AppColors
                                      .grayscale00, // Set font color based on status
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.delivery_dining,
                                  size: 20,
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
                            Text(
                              'Not Assigned',
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale60),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.home,
                              size: 20,
                              color: AppColors.grayscale60,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.order.customeraddress,
                              style: AppFonts.headline4(
                                  color: AppColors.grayscale60),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 20,
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: AppColors.grayscale20),
                    color: AppColors.grayscale00,
                  ),
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
                                  Icons.shopping_cart_outlined,
                                  color: AppColors.grayscale90,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Items',
                                  style: AppFonts.title5(
                                    color: AppColors.grayscale90,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.order.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = widget.order.cartItems[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0), // Add space between cards
                              child: DriverCartItemCard(
                                imagePath: item.imagePath,
                                productName: item.productName,
                                price: item.price,
                                quantity: item.quantity,
                                onQuantityChanged: (newQuantity) {},
                                discountprice: item.discountedPrice,
                                onDelete: () => (item),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColors.grayscale20),
            color: AppColors.grayscale00,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.secondary50,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Assigned To Me',
                      style: AppFonts.body1(color: AppColors.grayscale90),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primary40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Start Maps',
                      style: AppFonts.body1(color: AppColors.grayscale0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
