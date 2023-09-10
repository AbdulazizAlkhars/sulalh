import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  final Function(String) onDateSelected;

  DateTextField({required this.onDateSelected});

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'DD:MM:YYYY',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _openDatePicker(context),
            ),
          ),
        ),
      ],
    );
  }

  void _openDatePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      String formattedDate =
          '${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year.toString()}';
      _dateController.text = formattedDate;
      widget.onDateSelected(formattedDate);
    } else {
      // Handle the case when no date is selected, e.g., you can clear the text field.
      _dateController.clear();
    }
  }
}
