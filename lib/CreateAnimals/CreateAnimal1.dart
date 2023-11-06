import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/CreateAnimals/SelectedOptions.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class CreateAnimalPage extends ConsumerStatefulWidget {
  const CreateAnimalPage({Key? key}) : super(key: key);

  @override
  _CreateAnimalPageState createState() => _CreateAnimalPageState();
}

class _CreateAnimalPageState extends ConsumerState<CreateAnimalPage> {
  String selectedAnimalType = '';
  String selectedAnimalSpecies = '';
  String selectedAnimalBreed = '';
  bool showAnimalSpeciesSection = false;
  bool showAnimalBreedsSection = false;
  bool areAllOptionsSelected() {
    final selectedAnimalType = ref.watch(selectedAnimalTypeProvider);
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
    'Mammal': 'assets/avatars/120px/Horse_avatar.png',
    'Oviparous': 'assets/avatars/120px/Duck.png',
    // Add more entries for other animal types and their images
  };

  @override
  Widget build(BuildContext context) {
    final selectedAnimalType = ref.watch(selectedAnimalTypeProvider);
    final selectedAnimalSpecies = ref.watch(selectedAnimalSpeciesProvider);
    final selectedAnimalBreed = ref.watch(selectedAnimalBreedsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Animal',
          style: AppFonts.headline3(color: AppColors.grayscale90),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grayscale10,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: AppColors.grayscale90,
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.042,
              right: MediaQuery.of(context).size.width * 0.042),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Animal Type',
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              Column(
                children: [
                  _buildAnimalTypeOption('Mammal'),
                  _buildAnimalTypeOption('Oviparous'),
                  // Add more animal type options here
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              if (showAnimalSpeciesSection) // Conditionally show if selected
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.912,
                        color: AppColors.grayscale20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Animal Species',
                      style: AppFonts.headline2(color: AppColors.grayscale90),
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
                  ],
                ),
              if (showAnimalBreedsSection) // Conditionally show if selected
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.007,
                  ),
                  Center(
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.912,
                      color: AppColors.grayscale20,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Animal Breeds',
                    style: AppFonts.headline2(color: AppColors.grayscale90),
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
    final isSelected =
        ref.read(selectedAnimalTypeProvider.notifier).state == animalType;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageAsset),
        backgroundColor: Colors.transparent,
      ),
      title:
          Text(animalType, style: AppFonts.body2(color: AppColors.grayscale90)),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.064,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
            width: isSelected ? 6.0 : 1.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          ref
              .read(selectedAnimalTypeProvider.notifier)
              .update((state) => animalType);
        });
      },
    );
  }

  Widget _buildAnimalSpeciesOption(String optionText) {
    final isSelected = selectedAnimalSpecies == optionText;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title:
          Text(optionText, style: AppFonts.body2(color: AppColors.grayscale90)),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.064,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
            width: isSelected ? 6.0 : 1.0,
          ),
        ),
      ),
      onTap: () {
        // setState(() {
        //   selectedAnimalSpecies = isSelected ? '' : optionText;
        // });
        setState(() {
          ref
              .read(selectedAnimalSpeciesProvider.notifier)
              .update((state) => optionText);
          selectedAnimalSpecies = isSelected ? '' : optionText;
        });
      },
    );
  }

  Widget _buildAnimalBreedOption(String optionText) {
    final isSelected = selectedAnimalBreed == optionText;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        optionText,
        style: AppFonts.body2(color: AppColors.grayscale90),
      ),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.064,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary20 : AppColors.grayscale30,
            width: isSelected ? 6.0 : 1.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          ref
              .read(selectedAnimalBreedsProvider.notifier)
              .update((state) => optionText);
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
                              if (section == 'species') {
                                ref
                                    .read(
                                        selectedAnimalSpeciesProvider.notifier)
                                    .update((state) => item);
                                selectedAnimalSpecies = item;
                              } else if (section == 'breeds') {
                                ref
                                    .read(selectedAnimalBreedsProvider.notifier)
                                    .update((state) => item);
                                selectedAnimalBreed = item;
                              }
                              Navigator.pop(context, item);
                            });
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
