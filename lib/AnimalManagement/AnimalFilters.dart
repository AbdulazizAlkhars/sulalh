import 'package:flutter/material.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class AnimalFilters extends StatefulWidget {
  @override
  _AnimalFilters createState() => _AnimalFilters();
}

class _AnimalFilters extends State<AnimalFilters> {
  Map<String, List<String>> sectionItems = {
    'Animal Type': ['Mammal', 'Oviparous'],
    'Animal Species': ['Sheep', 'Cow', 'Horse'],
    'Animal Breed': ['Altaaai stoat', 'East Siberian stoat', 'Gobi stoat'],
    'Animal Sex': ['Male', 'Female'],
    'Breeding Stage': ['Ready for breeding', 'Pregnant', 'Lactating'],
    'Tags': ['Borrowed', 'Adopted', 'DDonated'],
  };

  Map<String, String?> selectedAnimals = {};

  @override
  void initState() {
    super.initState();
    sectionItems.keys.forEach((heading) {
      selectedAnimals[heading] = null;
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Show More"),
          content: Text("You tapped the 'Show more >' button."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Animals'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                selectedAnimals.clear();
                sectionItems.keys.forEach((heading) {
                  selectedAnimals[heading] = null;
                });
              });
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sectionItems.length,
        itemBuilder: (context, sectionIndex) {
          String sectionHeading = sectionItems.keys.elementAt(sectionIndex);
          List<String> sectionLanguages = sectionItems[sectionHeading]!;
          String? selectedLanguage = selectedAnimals[sectionHeading];

          bool showShowMoreButton =
              sectionHeading != 'Animal Type' && sectionHeading != 'Animal Sex';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  sectionHeading,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: showShowMoreButton
                    ? sectionLanguages.length + 1
                    : sectionLanguages.length,
                itemBuilder: (context, index) {
                  if (showShowMoreButton && index == sectionLanguages.length) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _showDialog(context); // Show dialog on tap
                        },
                        child: Text(
                          'Show more >',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(
                                255, 36, 86, 38), // Customize the text color
                          ),
                        ),
                      ),
                    );
                  }

                  String language = sectionLanguages[index];
                  bool isSelected = language == selectedLanguage;
                  bool isMaleSelected = selectedAnimals['Animal Sex'] == 'Male';
                  bool isBreedingStage = sectionHeading == 'Breeding Stage';
                  bool isPregnantOrLactating =
                      language == 'Pregnant' || language == 'Lactating';

                  if (isMaleSelected &&
                      isBreedingStage &&
                      isPregnantOrLactating) {
                    isSelected = false;
                  }

                  Color borderColor = isSelected ? Colors.green : Colors.grey;
                  Color trailingColor = isPregnantOrLactating && isMaleSelected
                      ? const Color.fromARGB(117, 158, 158, 158)
                      : Colors.transparent;
                  Color textColor = isPregnantOrLactating && isMaleSelected
                      ? Colors.grey
                      : Colors.black;

                  return ListTile(
                    title: Text(
                      language,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                      ),
                    ),
                    trailing: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor,
                          width: isSelected ? 6.0 : 2.0,
                        ),
                        color: trailingColor,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedAnimals[sectionHeading] = null;
                        } else {
                          selectedAnimals[sectionHeading] = language;
                        }
                      });
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ButtonWidget(
          onPressed: () {},
          buttonText: 'Continue',
        ),
      ),
    );
  }
}
