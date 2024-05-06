import 'package:flutter/material.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

class SuggestableTextField extends StatefulWidget {
  final String hintText;
  final List<String> suggestions;

  const SuggestableTextField({
    Key? key,
    required this.hintText,
    required this.suggestions,
  }) : super(key: key);

  @override
  _SuggestableTextFieldState createState() => _SuggestableTextFieldState();
}

class _SuggestableTextFieldState extends State<SuggestableTextField> {
  @override
  void initState() {
    super.initState();
// Initialize selected value
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: AppColors.grayscale20), // Outline color
            color: Colors.white, // Background color
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: EasyAutocomplete(
              inputTextStyle: AppFonts.body2(
                color: AppColors.grayscale90,
              ),
              suggestionBackgroundColor: AppColors.grayscale00,
              suggestions: widget.suggestions,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: AppColors.grayscale50), // Change hint text color

                border: InputBorder.none,
              ),
              suggestionBuilder: (data) {
                return Container(
                  margin: const EdgeInsets.all(1),
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    data,
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
