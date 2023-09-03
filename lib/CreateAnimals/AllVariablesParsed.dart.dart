// display_page.dart

import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayPage extends StatelessWidget {
  final String fieldName;
  final String fieldContent;
  final TextEditingController notesController;
  final String selectedOviSire;
  final String selectedDate;
  final String selectedOviDam;
  TextEditingController nameController;
  TextEditingController frequencyEggsController;
  TextEditingController numberofEggsController;
  // final DateTime? selectedOviDate;
  final List<String> selectedOviChips;
  final Map<String, DateTime?> selectedOviDates;
  final bool showAdditionalFields;
  final String selectedOviDateType;
  final String selectedOviGender;
  final bool addOviParents;
  final bool addOviChildren;
  final File? selectedOviImage;

  DisplayPage({
    required this.fieldName,
    required this.fieldContent,
    required this.notesController,
    required this.selectedOviSire,
    required this.selectedOviDam,
    // required this.selectedOviDate,
    required this.selectedOviChips,
    required this.selectedOviDates,
    required this.showAdditionalFields,
    required this.selectedOviDateType,
    required this.selectedOviGender,
    required this.addOviParents,
    required this.addOviChildren,
    required this.selectedOviImage,
    required this.nameController,
    required this.selectedDate,
    required this.frequencyEggsController,
    required this.numberofEggsController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${nameController.text}'),
            Text('Frequency Of Eggs/Month: ${frequencyEggsController.text}'),
            Text('Number Of Eggs/Month: ${numberofEggsController.text}'),
            Text('Notes: ${notesController.text}'),
            Text('Sire(Father): $selectedOviSire'),
            Text('Dam(Mother): $selectedOviDam'),
            Text('Date Of Birth: ${selectedDate.toString()}'),
            Text('Tags: ${selectedOviChips.join(', ')}'),
            Text('Additional Dates: ${selectedOviDates.toString()}'),
            Text('Show Additional Fields: $showAdditionalFields'),
            Text('Field Name: $fieldName'),
            Text('Field Content: $fieldContent'),
            Text('Selected Ovi Date Type: $selectedOviDateType'),
            Text('Gender: $selectedOviGender'),
            Text('Add Ovi Parents: $addOviParents'),
            Text('Add Ovi Children: $addOviChildren'),
            if (selectedOviImage != null)
              Image.file(
                selectedOviImage!,
                width: 200,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
