import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _openDatePicker(context),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  void _openDatePicker(BuildContext context) async {
    // Show the CupertinoDatePicker in a modal bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height:
              MediaQuery.of(context).size.height * 0.4, // Set a specific height
          child: IntrinsicHeight(
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2100),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (selectedDate) {
                // When a date is selected, update the TextField text
                setState(() {
                  _selectedDate = selectedDate;
                  String formattedDate =
                      '${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year.toString()}';
                  _dateController.text = formattedDate;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
