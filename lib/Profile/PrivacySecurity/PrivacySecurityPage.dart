// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';

class PrivacySecurityPage extends StatefulWidget {
  const PrivacySecurityPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Privacy & Security'.tr,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: Text('Allow Collaboration'.tr),
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
                  'Show List Of Animals'.tr,
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
                  'Show Family Tree'.tr,
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
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Contact Information'.tr,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text('Show Contact Information'.tr),
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
                          title: Text('Phone Number'.tr),
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
                        Consumer(
                          builder: (context, ref, child) {
                            final phoneNumberVisibility =
                                ref.watch(phoneNumeberVisibilityProvider);

                            return ListTile(
                              title: Text('Email Address'.tr),
                              trailing: Switch(
                                value: phoneNumberVisibility,
                                onChanged: _ShowContactInfo
                                    ? (value) {
                                        ref
                                            .read(phoneNumeberVisibilityProvider
                                                .notifier)
                                            .update((state) => value);
                                      }
                                    : null,
                              ),
                            );
                          },
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final emailAddressVisibility =
                                ref.watch(emailAddressVisibilityProvider);

                            return ListTile(
                              title: Text('Email Address'.tr),
                              trailing: Switch(
                                value: emailAddressVisibility,
                                onChanged: _ShowContactInfo
                                    ? (value) {
                                        ref
                                            .read(emailAddressVisibilityProvider
                                                .notifier)
                                            .update((state) => value);
                                      }
                                    : null,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ]));
  }
}
