import 'package:flutter/material.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';

class SearchableDropdown extends StatefulWidget {
  const SearchableDropdown({Key? key}) : super(key: key);

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
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
          child: EasyAutocomplete(
            inputTextStyle: AppFonts.body2(
              color: AppColors.grayscale90,
            ),
            suggestionBackgroundColor: AppColors.grayscale00,
            suggestions: Suggestions.petProductSuggestions,
            onChanged: (value) {}, // Dummy onChanged callback

            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                  color: AppColors.grayscale50), // Change hint text color
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primary40,
              ),
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
      ],
    );
  }
}