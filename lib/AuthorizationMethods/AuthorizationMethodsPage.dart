import 'package:flutter/material.dart';
import 'package:hathera_demo/AuthorizationMethods/AddNewEmail.dart';
import 'package:hathera_demo/AuthorizationMethods/AddNewPhoneNumber.dart';

class AuthorizationMethodsPage extends StatefulWidget {
  @override
  _AuthorizationMethodsPage createState() => _AuthorizationMethodsPage();
}

class _AuthorizationMethodsPage extends State<AuthorizationMethodsPage> {
  String phoneNumber = '';
  String emailAddress = '';

  bool _hasPhoneNumber =
      false; // Replace with the actual logic to check if the user has a phone number
  bool _hasEmailAddress = false;
  List<String> linkedAccounts = [
    'Google Account',
    'Apple Account',
  ];
  List<String> linkedAccountIcons = [
    'assets/AccountProfile/GoogleLogo.png', // Replace with the actual icon path
    'assets/AccountProfile/AppleLogo.png', // Replace with the actual icon path
  ];
  void updatePhoneNumber(String number) {
    setState(() {
      _hasPhoneNumber = true;
      phoneNumber = number;
    });
  }

  void updateemailAddress(String text) {
    setState(() {
      _hasEmailAddress = true;
      emailAddress = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Authorization Methods',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      _hasPhoneNumber ? '$phoneNumber' : 'Add',
                      style: TextStyle(
                          fontSize: 16,
                          color: _hasPhoneNumber
                              ? Colors.black
                              : Color.fromARGB(255, 36, 86, 38),
                          fontWeight: _hasPhoneNumber
                              ? FontWeight.normal
                              : FontWeight.bold),
                    ),
                  ),
                  Visibility(
                    visible: !_hasPhoneNumber,
                    child: Expanded(
                      flex: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          color: Color.fromARGB(255, 36, 86, 38),
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddNewPhoneNumber(
                                  onPhoneNumberUpdated: updatePhoneNumber),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      _hasEmailAddress ? '$emailAddress' : 'Add',
                      style: TextStyle(
                        color: _hasEmailAddress
                            ? Colors.black
                            : Color.fromARGB(255, 36, 86, 38),
                        fontWeight: _hasEmailAddress
                            ? FontWeight.normal
                            : FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_hasEmailAddress,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        color: Color.fromARGB(255, 36, 86, 38),
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddNewEmail(onEmailUpdated: updateemailAddress),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      _hasEmailAddress ? '$emailAddress' : 'Add',
                      style: TextStyle(
                        color: _hasEmailAddress
                            ? Colors.black
                            : Color.fromARGB(255, 36, 86, 38),
                        fontWeight: _hasEmailAddress
                            ? FontWeight.normal
                            : FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_hasEmailAddress,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        color: Color.fromARGB(255, 36, 86, 38),
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddNewEmail(onEmailUpdated: updateemailAddress),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Linked Accounts',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: linkedAccounts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    linkedAccountIcons[index],
                    width: 33,
                    height: 33,
                  ),
                  title: Text(
                    linkedAccounts[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
