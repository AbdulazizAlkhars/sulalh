import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  final TextEditingController _dateController = TextEditingController();
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
            hintText: 'DD:MM:YYYY', // Add your hint text here
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(50.0), // Adjust border radius as needed
              borderSide: const BorderSide(
                color: Colors.grey, // Change the border color here
                width: 2.0, // Change the border width here
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 16.0), // Adjust padding as needed
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today,
                  color: Color.fromARGB(255, 36, 86, 38)),
              onPressed: () => _openDatePicker(context),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _openDatePicker(BuildContext context) async {
    // Show the CupertinoDatePicker in a modal bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
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
