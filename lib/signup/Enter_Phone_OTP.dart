// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/Account_Setup/Add_Personal_Information.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class PhoneOTPScreen extends StatefulWidget {
  const PhoneOTPScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneOTPScreen createState() => _PhoneOTPScreen();
}

class _PhoneOTPScreen extends State<PhoneOTPScreen> {
  List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());
  List<String> otpDigits = List.generate(6, (_) => '');

  int timerCountdown = 30;
  Timer? timer;

  bool isDigitsCompleted = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    for (final focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (timerCountdown > 0) {
          timerCountdown--;
        } else {
          timer?.cancel();
        }
      });
    });
  }

  String getFormattedTime() {
    int minutes = (timerCountdown / 60).floor();
    int seconds = timerCountdown % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void checkDigitsCompletion() {
    bool allDigitsEntered = otpDigits.every((digit) => digit.isNotEmpty);
    setState(() {
      isDigitsCompleted = allDigitsEntered;
    });
  }

  void deleteDigit(int index) {
    if (index > 0) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
    }
    setState(() {
      otpDigits[index] = '';
    });
    checkDigitsCompletion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Code'.tr,
                    style: AppFonts.title2(color: AppColors.grayscale90),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We sent a verification code to the following'.tr,
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  Text(
                    'Phone Number:'.tr,
                    style: AppFonts.body2(color: AppColors.grayscale70),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (index) => _buildCircle(index),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send New Code:'.tr,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      getFormattedTime(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isDigitsCompleted
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPersonalInfoPage()),
                            );
                            // Add your continue button logic here
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDigitsCompleted
                          ? const Color.fromARGB(255, 36, 86, 38)
                          : Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Confirm'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(int index) {
    final focusNode = otpFocusNodes[index];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        alignment: Alignment.center,
        child: TextFormField(
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maxLength: 1,
          onChanged: (value) {
            setState(() {
              otpDigits[index] = value;
            });

            checkDigitsCompletion();

            if (value.isNotEmpty) {
              if (index < otpFocusNodes.length - 1) {
                FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
              } else {
                FocusScope.of(context).unfocus();
              }
            } else {
              if (index > 0) {
                deleteDigit(index);
              }
            }
          },
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
