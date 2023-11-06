import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/searchbar.dart';
import 'package:hathera_demo/data/countryDetails.dart';

class CountriesWidget extends StatefulWidget {
  final CountrySelectionCallback onCountrySelected;

  const CountriesWidget({Key? key, required this.onCountrySelected})
      : super(key: key);

  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  List<CountryInfo> filteredCountries = countriesData;
  String searchQuery = "";

  void _filterCountries(String query) {
    setState(() {
      searchQuery = query;
      filteredCountries = countriesData
          .where((country) =>
              country.countryName.toLowerCase().contains(query.toLowerCase()) ||
              country.countryCode.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showNotFoundText =
        searchQuery.isNotEmpty && filteredCountries.isEmpty;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PrimarySearchBar(
            hintText: 'Search for a country',
            onChange: _filterCountries,
          ),
        ),
        if (showNotFoundText)
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Country not found!",
              style: AppFonts.headline2(color: AppColors.grayscale90),
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCountries.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(filteredCountries[index].flagImagePath),
                title: Text(filteredCountries[index].countryName),
                subtitle: Text(filteredCountries[index].countryCode),
                onTap: () {
                  // Pass the selected country info back to the parent widget
                  widget.onCountrySelected(filteredCountries[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

typedef CountrySelectionCallback = void Function(CountryInfo countryInfo);

// Example of use: 


//Functions to be added to the class:
// void _onCountrySelected(CountryInfo countryInfo) {
//     setState(
//       () {
//         selectedCountry = countryInfo;
//         countryCode = countryInfo.countryCode;
//         countryFlag = countryInfo.flagImagePath;
//         print(countryInfo.countryName);
//       },
//     );
//     Navigator.pop(context);
//   }



// SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.95,
//                   child: CountriesWidget(
//                     onCountrySelected: _onCountrySelected,
//                   ),
//                 ),