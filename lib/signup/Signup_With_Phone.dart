import 'package:flutter/material.dart';
import 'package:hathera_demo/signup/Enter_Phone_OTP.dart';
import 'package:hathera_demo/signup/Signup_With_Email.dart';

class PhnSignupPage extends StatefulWidget {
  @override
  _PhnSignupPage createState() => _PhnSignupPage();
}

class _PhnSignupPage extends State<PhnSignupPage> {
  String selectedCountryCode = '+971'; // Initial selected country code

  void _showCountryCodeSelection() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.5;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: sheetHeight,
          child: ListView(
            children: [
              ListTile(
                title: Text('+971'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+971';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+966'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+966';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+965'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+965';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+964'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+964';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+975'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+975';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+976'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+976';
                  });
                  Navigator.pop(context);
                },
              ),
              // Add more Middle East country codes as needed
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 180),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'LOGO',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 86, 38),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome To',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Hathera!',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: GestureDetector(
                                onTap:
                                    _showCountryCodeSelection, // Open country code selection
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 12),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedCountryCode,
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter Mobile Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 12),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 36, 86, 38),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your continue button logic here
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 242, 242, 242),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Icon(
                                Icons.apple,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 90),
                            Text(
                              'Continue With Apple',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your continue button logic here
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 242, 242, 242),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Icon(
                                Icons.android,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 90),
                            Text(
                              'Continue With Google',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailSignupPage()),
                          );
                          // Add your continue button logic here
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Use Email Address',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 36, 86, 38),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
