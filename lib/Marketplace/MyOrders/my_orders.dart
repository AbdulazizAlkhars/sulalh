import 'package:flutter/material.dart';

import '../../Theme/Colors.dart';
import '../../Theme/Fonts.dart';
import 'item_orders.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'My Orders',
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
        actions: [
          IconButton(
            icon: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        bottom: TabBar(
          indicatorColor: AppColors.primary30,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColors.grayscale60,
          labelColor: AppColors.primary30,
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Items',
            ),
            Tab(text: 'Animals'),
            Tab(text: 'Services'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content for Items tab
          MyItemsOrders(),
          // Content for Animals tab
          Center(child: Text('Animals Content')),
          // Content for Services tab
          Center(child: Text('Services Content')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
