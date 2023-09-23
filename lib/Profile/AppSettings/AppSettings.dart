import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppSettings createState() => _AppSettings();
}

class _AppSettings extends State<AppSettings> {
  String selectedLanguage = '';
  String selectedLanguageTemp = '';

  void _showLanguageSelection() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.38;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: sheetHeight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Language Of The App'.tr,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('English'.tr),
                            trailing: selectedLanguageTemp == 'English'.tr
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                selectedLanguageTemp = 'English'.tr;
                              });
                            },
                          ),
                          ListTile(
                            title: Text('Arabic'.tr),
                            trailing: selectedLanguageTemp == 'Arabic'.tr
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                selectedLanguageTemp = 'Arabic'.tr;
                              });
                            },
                          ),
                          ListTile(
                            title: Text('French'.tr),
                            trailing: selectedLanguageTemp == 'French'.tr
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 6.0,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                selectedLanguageTemp = 'French'.tr;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ButtonWidget(
                      onPressed: () {
                        setState(() {
                          selectedLanguage = selectedLanguageTemp;
                        });
                        Navigator.pop(context);
                      },
                      buttonText: 'Save'.tr,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        selectedLanguage = selectedLanguageTemp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Settings'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(selectedLanguage),
                        ),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ],
                ),
                onTap: _showLanguageSelection,
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
