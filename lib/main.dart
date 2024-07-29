import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/HomeScreen/Registered/HomePage.dart';
import 'package:hathera_demo/Profile/BottomNavigationBar/BottomNBScreens.dart';

import 'package:hathera_demo/localization/localestrings.dart';
import 'package:hathera_demo/newfeatures/SulalaFeed/feedpage.dart';

import 'newfeatures/Fetus/mammals_lits.dart';
import 'newfeatures/SulalaFeed/add_images_modal_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sulalh Demo',
        translations: LocalStrings(),
        locale: const Locale('en', 'US'),
        home: bottomNavigationBarPage());
  }
}
