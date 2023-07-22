import 'package:flutter/material.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';
import 'package:hathera_demo/signup/Signup_With_Phone.dart';

class WhoOwnsFarm extends StatefulWidget {
  @override
  _WhoOwnsFarm createState() => _WhoOwnsFarm();
}

class _WhoOwnsFarm extends State<WhoOwnsFarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/SignUp/Background-image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 270),
            child: Column(
              children: [
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
                                'Who Owns The Farm?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.black,
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
                          child: CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ButtonWidget(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhnSignupPage()),
                            );
                            // Add your continue button logic here
                          },
                          buttonText: 'Continue',
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
                      Container(
                        height: 300,
                      ),
                    ],
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
