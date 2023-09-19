import 'package:flutter/material.dart';
import 'package:hathera_demo/Tutorials/GuestHomeScreen.dart';
import 'package:showcaseview/showcaseview.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading =
      true; // Set this to false when you want to hide the loading indicator

  @override
  void initState() {
    super.initState();

    // Simulate loading for 2 seconds (you can adjust this duration)
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        isLoading = false; // Hide the loading indicator
      });

      // After the delay, navigate to the GuestHomeScreenTutorial
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ShowCaseWidget(
            builder: Builder(
              builder: (context) => const GuestHomeScreenTutorial(),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/AccountProfile/Frame.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 16), // Add some space between the images
              Expanded(
                child: Image.asset(
                  'assets/AccountProfile/splashscreenimg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
