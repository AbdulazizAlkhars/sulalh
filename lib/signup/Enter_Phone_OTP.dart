import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hathera_demo/Account_Setup/Add_Personal_Information.dart';

class PhoneOTPScreen extends StatefulWidget {
  @override
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
    timer = Timer.periodic(Duration(seconds: 1), (_) {
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Code',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We sent a verification code to the following ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Phone Number: (Entered Mobile Number) ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
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
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Send New Code: ${getFormattedTime()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                    child: const Text(
                      'Confirm',
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
          style: TextStyle(
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
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
