// display_page.dart

import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayPage extends StatefulWidget {
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
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
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
            Text('Name: ${widget.nameController.text}'),
            Text(
                'Frequency Of Eggs/Month: ${widget.frequencyEggsController.text}'),
            Text('Number Of Eggs/Month: ${widget.numberofEggsController.text}'),
            Text('Notes: ${widget.notesController.text}'),
            Text('Sire(Father): ${widget.selectedOviSire}'),
            Text('Dam(Mother): ${widget.selectedOviDam}'),
            Text('Date Of Birth: ${widget.selectedDate.toString()}'),
            Text('Tags: ${widget.selectedOviChips.join(', ')}'),
            Text('Additional Dates: ${widget.selectedOviDates.toString()}'),
            Text('Show Additional Fields: ${widget.showAdditionalFields}'),
            Text('Field Name: ${widget.fieldName}'),
            Text('Field Content: ${widget.fieldContent}'),
            Text('Selected Ovi Date Type: ${widget.selectedOviDateType}'),
            Text('Gender: ${widget.selectedOviGender}'),
            Text('Add Ovi Parents: ${widget.addOviParents}'),
            Text('Add Ovi Children: ${widget.addOviChildren}'),
            if (widget.selectedOviImage != null)
              Image.file(
                widget.selectedOviImage!,
                width: 200,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
