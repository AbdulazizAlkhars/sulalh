import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/DriverApp/driver_homepage.dart';
import 'package:hathera_demo/HomeScreen/Registered/HomePage.dart';
import 'package:hathera_demo/Marketplace/home_page.dart';
import 'package:hathera_demo/Profile/ProfilePage.dart';
import 'package:hathera_demo/Theme/Colors.dart';

class bottomNavigationBarPage extends StatefulWidget {
  const bottomNavigationBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  bottomNavigationBarPageState createState() => bottomNavigationBarPageState();
}

class bottomNavigationBarPageState extends State<bottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    MarketplaceHomePage(),
    DriverHomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      body: pages[_currentIndex],
      bottomNavigationBar: IntrinsicHeight(
        child: BottomNavigationBar(
            backgroundColor: AppColors.grayscale00,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_basket),
                label: 'Marketplace',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.delivery_dining_sharp),
                label: 'Drivers App',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Profile'.tr,
              ),
            ],
            selectedIconTheme: IconThemeData(
                color: AppColors.primary40), // Change selected icon color
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            selectedItemColor: AppColors.primary40),
      ),
    );
  }
}
