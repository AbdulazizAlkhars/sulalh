import 'package:flutter/material.dart';
import 'package:hathera_demo/Profile/BottomNavigationBar/BottomNBScreens.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sulalh Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 36, 86, 38),
          ),
          useMaterial3: true,
        ),
        home: StartWidget());
  }
}

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(builder: Builder(builder: (context) {
      return BottomNavigationBarPage();
    }));
  }
}
