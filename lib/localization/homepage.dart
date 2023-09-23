import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Hindi', 'locale': Locale('hi', 'IN')},
    {'name': 'Arabic', 'locale': Locale('ar', 'SA')},
  ];

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Choose Language'),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          updatelanguage(locale[index]['locale']);
                        },
                        child: Text(locale[index]['name']));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello'.tr,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Message'.tr,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  builddialog(context);
                },
                child: Text('ChangeLang'.tr))
          ],
        ),
      ),
    );
  }
}
