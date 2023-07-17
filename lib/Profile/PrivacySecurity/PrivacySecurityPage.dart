import 'package:flutter/material.dart';

class PrivacySecurityPage extends StatefulWidget {
  @override
  _PrivacySecurityPage createState() => _PrivacySecurityPage();
}

class _PrivacySecurityPage extends State<PrivacySecurityPage> {
  bool _AllowCollab = true;
  bool _ShowListOfAnimals = false;
  bool _ShowFamilyTree = false;
  bool _ShowContactInfo = false;
  bool _PhoneNumber = false;
  bool _EmailAddress = false;

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
            // padding: EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              'Privacy & Security',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Allow Collaboration'),
            trailing: Switch(
              value: _AllowCollab,
              onChanged: (value) {
                setState(() {
                  _AllowCollab = value;
                  if (!value) {
                    // Reset the values of Phone Number and Email Address switches
                    _ShowListOfAnimals = false;
                    _ShowFamilyTree = false;
                  }
                });
              },
            ),
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  'Show List Of Animals',
                  style: TextStyle(
                    color: (_AllowCollab) ? null : Colors.grey,
                  ),
                ),
                trailing: Switch(
                  value: _ShowListOfAnimals,
                  onChanged: _AllowCollab
                      ? (value) {
                          setState(() {
                            _ShowListOfAnimals = value;
                          });
                        }
                      : null,
                ),
              ),
              ListTile(
                title: Text(
                  'Show Family Tree',
                  style: TextStyle(
                    color: (_AllowCollab) ? null : Colors.grey,
                  ),
                ),
                trailing: Switch(
                  value: _ShowFamilyTree,
                  onChanged: _AllowCollab
                      ? (value) {
                          setState(() {
                            _ShowFamilyTree = value;
                          });
                        }
                      : null,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    title: Text('Show Contact Information'),
                    trailing: Switch(
                      value: _ShowContactInfo,
                      onChanged: (value) {
                        setState(() {
                          _ShowContactInfo = value;
                          if (!value) {
                            // Reset the values of Phone Number and Email Address switches
                            _PhoneNumber = false;
                            _EmailAddress = false;
                          }
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: _ShowContactInfo,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Phone Number'),
                          trailing: Switch(
                            value: _PhoneNumber,
                            onChanged: _ShowContactInfo
                                ? (value) {
                                    setState(() {
                                      _PhoneNumber = value;
                                    });
                                  }
                                : null,
                          ),
                        ),
                        ListTile(
                          title: Text('Email Address'),
                          trailing: Switch(
                            value: _EmailAddress,
                            onChanged: _ShowContactInfo
                                ? (value) {
                                    setState(() {
                                      _EmailAddress = value;
                                    });
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ])));
  }
}
