import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketplaceWidgets/textfield_suggestion_widget.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../ProductMarketPlacePages/add_new_address.dart';

class AddYourStoreModal extends StatefulWidget {
  const AddYourStoreModal({Key? key}) : super(key: key);

  @override
  _AddYourStoreModalState createState() => _AddYourStoreModalState();
}

class _AddYourStoreModalState extends State<AddYourStoreModal> {
  String? selectedAnimal;
  bool isExpanded = false;
  late TextEditingController _searchController;
  List<Map<String, dynamic>> filteredAnimals = [];
  int selectedIndex = -1;
  int selectedSpeciesIndex = -1;
  String selectedBreed = '';
  String? selectedGovernorate;
  List<String> selectedCities = [];
  @override
  void initState() {
    super.initState();
    filteredAnimals = myAnimals;
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredAnimals = myAnimals
          .where((animal) => animal['name']
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Center(
                  child: Text(
                    'Join Sulala To Sell',
                    style: AppFonts.title4(color: AppColors.grayscale90),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.primary50,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      'Sulala.com',
                      style: AppFonts.body1(color: AppColors.grayscale00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'To start registering your business with Sulala,\nPlease fill the application or visit our website',
              style: AppFonts.headline4(color: AppColors.grayscale90),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.029),
            Text("Name Of Your Store*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
                hintText: 'Enter The Name Of Your Store*', suggestions: []),
            const SizedBox(
              height: 10,
            ),
            Text("Your Website Or Social Media Link*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
                hintText: 'Enter The Name Of Your Store*', suggestions: []),
            const SizedBox(
              height: 10,
            ),
            Text("Name Of Your Governorate*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
              hintText: 'Enter Governorate*',
              suggestions: governorates,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Name Of Your Area*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
              hintText: 'Enter Area*',
              suggestions: citiesByGovernorate.values
                  .expand((cities) => cities)
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Your Full Name*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
              hintText: 'Enter Full Name*',
              suggestions: governorates,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Contact Number*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
              hintText: 'Enter Contact Number*',
              suggestions: governorates,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Email Address*",
                style: AppFonts.body2(color: AppColors.grayscale90)),
            SuggestableTextField(
              hintText: "Email Address*",
              suggestions: governorates,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.transparent,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNewAddress()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Submit The Application',
                  style: AppFonts.body1(color: AppColors.grayscale0),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
