import 'package:flutter/material.dart';
import 'package:hathera_demo/CreateAnimals/SelectedOptions.dart';

class CreateAnimalPage extends StatefulWidget {
  const CreateAnimalPage({Key? key}) : super(key: key);

  @override
  _CreateAnimalPageState createState() => _CreateAnimalPageState();
}

class _CreateAnimalPageState extends State<CreateAnimalPage> {
  String selectedAnimalType = '';
  String selectedAnimalSpecies = '';
  String selectedAnimalBreed = '';
  bool showAnimalSpeciesSection = false;
  bool showAnimalBreedsSection = false;
  bool areAllOptionsSelected() {
    return selectedAnimalType.isNotEmpty &&
        selectedAnimalSpecies.isNotEmpty &&
        selectedAnimalBreed.isNotEmpty;
  }

  List<String> mammalSpeciesList = ['Sheep', 'Cow', 'Horse'];
  List<String> mammalBreedsList = ['Bengal', 'African', 'Reticulated'];

  List<String> oviparousSpeciesList = ['Tiger', 'Elephant', 'Giraffe'];
  List<String> oviparousBreedsList = ['Bengali', 'Africani', 'Reticulatedii'];

  // Additional lists for mammal and oviparous species and breeds
  List<String> additionalMammalSpeciesList = ['Lion', 'Deer', 'Goat'];
  List<String> additionalMammalBreedsList = ['Lioness', 'Roe', 'Mountain Goat'];

  List<String> additionalOviparousSpeciesList = [
    'Crocodile',
    'Turtle',
    'Snake'
  ];
  List<String> additionalOviparousBreedsList = [
    'Nile Crocodile',
    'Sea Turtle',
    'Python'
  ];

  // Define a map to associate animal types with their image asset paths
  final Map<String, String> animalImages = {
    'Mammal': 'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
    'Oviparous': 'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg',
    // Add more entries for other animal types and their images
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Animal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Animal Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                _buildAnimalTypeOption('Mammal'),
                _buildAnimalTypeOption('Oviparous'),
                // Add more animal type options here
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            if (showAnimalSpeciesSection) // Conditionally show if selected
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Animal Species',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (String species in selectedAnimalType == 'Mammal'
                      ? mammalSpeciesList
                      : oviparousSpeciesList)
                    _buildAnimalSpeciesOption(species),

                  TextButton(
                    onPressed: () {
                      _showModalSheet('species',
                          selectedAnimalType); // Show modal sheet on button press
                    },
                    child: const Text(
                      'Show More >',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 36, 86, 38),
                      ),
                    ),
                  ),
                  const Divider(), // Divider between species and breeds
                ],
              ),
            if (showAnimalBreedsSection) // Conditionally show if selected
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Animal Breeds',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (String breed in selectedAnimalType == 'Mammal'
                    ? mammalBreedsList
                    : oviparousBreedsList)
                  _buildAnimalBreedOption(breed),
                TextButton(
                  onPressed: () {
                    _showModalSheet('breeds',
                        selectedAnimalType); // Show modal sheet on button press
                  },
                  child: const Text(
                    'Show More >',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 36, 86, 38),
                    ),
                  ),
                ),
                const Divider(),
              ]),
            // Add more customization options here
            const SizedBox(height: 20),

            // Add more customization options here
            // Add more sections as needed
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              showAnimalSpeciesSection = selectedAnimalType.isNotEmpty;
              showAnimalBreedsSection = selectedAnimalSpecies.isNotEmpty;
            });
            if (areAllOptionsSelected()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedOptionsPage(
                    selectedAnimalType: selectedAnimalType,
                    selectedAnimalSpecies: selectedAnimalSpecies,
                    selectedAnimalBreed: selectedAnimalBreed,
                  ),
                ),
              );
            }
            // Handle "Continue" button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 36, 86, 38),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalTypeOption(String animalType) {
    final imageAsset = animalImages[animalType]!;
    final isSelected = selectedAnimalType == animalType;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageAsset),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        animalType,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 36, 86, 38)
                : Colors.grey,
            width: isSelected ? 6.0 : 2.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedAnimalType = animalType;
        });
      },
    );
  }

  Widget _buildAnimalSpeciesOption(String optionText) {
    final isSelected = selectedAnimalSpecies == optionText;

    return ListTile(
      title: Text(
        optionText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 36, 86, 38)
                : Colors.grey,
            width: isSelected ? 6.0 : 2.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedAnimalSpecies = isSelected ? '' : optionText;
        });
      },
    );
  }

  Widget _buildAnimalBreedOption(String optionText) {
    final isSelected = selectedAnimalBreed == optionText;

    return ListTile(
      title: Text(
        optionText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 36, 86, 38)
                : Colors.grey,
            width: isSelected ? 6.0 : 2.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedAnimalBreed = isSelected ? '' : optionText;
        });
      },
    );
  }

  void _showModalSheet(String section, String animalType) async {
    String searchText = ''; // Store the search text
    List<String> modalList;

    if (section == 'species') {
      modalList = animalType == 'Mammal'
          ? additionalMammalSpeciesList
          : additionalOviparousSpeciesList;
    } else if (section == 'breeds') {
      modalList = animalType == 'Mammal'
          ? additionalMammalBreedsList
          : additionalOviparousBreedsList;
    } else {
      return;
    }

    final selectedValue = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Build the modal content here
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText:
                                  'Search ${section == 'Species' ? 'Species' : 'Breeds'}...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: modalList.length,
                      itemBuilder: (context, index) {
                        final item = modalList[index];
                        if (searchText.isNotEmpty &&
                            !item
                                .toLowerCase()
                                .contains(searchText.toLowerCase())) {
                          return const SizedBox.shrink();
                        }
                        return ListTile(
                          leading: CircleAvatar(
                            // Add your circle avatar properties here
                            backgroundColor:
                                Colors.blue, // Change the background color
                            // You can also set backgroundImage if needed
                            // backgroundImage: AssetImage('your_image_asset_path.png'),
                          ),
                          title: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context, item);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (selectedValue != null) {
      setState(() {
        if (section == 'species') {
          if (animalType == 'Mammal') {
            mammalSpeciesList.remove(selectedValue);
            mammalSpeciesList.insert(0, selectedValue);
            selectedAnimalSpecies = selectedValue;
          } else {
            oviparousSpeciesList.remove(selectedValue);
            oviparousSpeciesList.insert(0, selectedValue);
            selectedAnimalSpecies = selectedValue;
          }
        } else if (section == 'breeds') {
          if (animalType == 'Mammal') {
            mammalBreedsList.remove(selectedValue);
            mammalBreedsList.insert(0, selectedValue);
            selectedAnimalBreed = selectedValue;
          } else {
            oviparousBreedsList.remove(selectedValue);
            oviparousBreedsList.insert(0, selectedValue);
            selectedAnimalBreed = selectedValue;
          }
        }
      });
    }
  }

  Widget _buildAdditionalOption(String optionText, String section) {
    return ListTile(
      title: Text(
        optionText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context, optionText);
      },
    );
  }
}
