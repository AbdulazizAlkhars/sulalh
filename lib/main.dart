import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Marketplace/home_page.dart';

import 'package:hathera_demo/Profile/BottomNavigationBar/BottomNBScreens.dart';
import 'package:hathera_demo/localization/localestrings.dart';

import 'Marketplace/ratings_reviews.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 36, 86, 38),
          ),
          useMaterial3: true,
        ),
        home: Marketplacehomepage());
  }
}
