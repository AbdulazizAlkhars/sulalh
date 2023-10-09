import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/FamilyTree.dart';
import 'package:hathera_demo/localization/localestrings.dart';

void main() {
  runApp(const MyApp());
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
        locale: Locale('en', 'US'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 36, 86, 38),
          ),
          useMaterial3: true,
        ),
        home: FamilyTree());
  }
}
