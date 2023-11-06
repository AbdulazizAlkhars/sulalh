import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';
import 'package:hathera_demo/signup/Enter_Email_OTP.dart';
import 'package:hathera_demo/signup/Signup_With_Phone.dart';

class EmailSignupPage extends StatefulWidget {
  const EmailSignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmailSignupPageState createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends State<EmailSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                ('assets/SignUp/Background-image.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.228,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width * 0.085),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width * 0.085),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.042,
                        0,
                        MediaQuery.of(context).size.width * 0.042,
                        MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome To Sulala!'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: CustomTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Enter Email'.tr,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.064,
                            width: double.infinity,
                          ),
                          Container(
                            child: ButtonWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmailOTPScreen()),
                                );
                                // Add your continue button logic here
                              },
                              buttonText: 'Continue'.tr,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                    child: Image.asset(
                                      'assets/icons/frame/24px/24_Apple.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  SizedBox(width: 90),
                                  Text(
                                    'Continue With Apple'.tr,
                                    style: AppFonts.body1(
                                        color: AppColors.grayscale100),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                    child: Image.asset(
                                      'assets/icons/frame/24px/24_Google.png',
                                      width: 26,
                                      height: 26,
                                    ),
                                  ),
                                  SizedBox(width: 90),
                                  Text(
                                    'Continue With Google'.tr,
                                    style: AppFonts.body1(
                                        color: AppColors.grayscale100),
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
                                      builder: (context) =>
                                          const PhnSignupPage()),
                                );
                                // Add your continue button logic here
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Use Phone Number'.tr,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
