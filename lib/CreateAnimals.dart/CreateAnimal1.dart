import 'package:flutter/material.dart';

class CreateAnimalPage extends StatefulWidget {
  const CreateAnimalPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateAnimalPageState createState() => _CreateAnimalPageState();
}

class _CreateAnimalPageState extends State<CreateAnimalPage> {
  String selectedAnimalType = '';
  String selectedAnimalSpecies = '';
  bool showAnimalSpeciesSection = false;
  List<String> animalSpeciesList = ['Sheep', 'Cow', 'Horse'];

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
      body: Column(
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
                for (String species in animalSpeciesList)
                  _buildAnimalSpeciesOption(species),
                TextButton(
                  onPressed: () {
                    _showModalSheet(); // Show modal sheet on button press
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
          // Add more customization options here
          const SizedBox(height: 20),

          // Add more customization options here
          // Add more sections as needed
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              showAnimalSpeciesSection = selectedAnimalType.isNotEmpty;
            });
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

  void _showModalSheet() async {
    final selectedValue = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildAdditionalSpeciesOption('Tiger'),
              _buildAdditionalSpeciesOption('Elephant'),
              _buildAdditionalSpeciesOption('Giraffe'),
              // Add more additional species options here
            ],
          ),
        );
      },
    );

    if (selectedValue != null) {
      setState(() {
        animalSpeciesList.remove(selectedValue);
        animalSpeciesList.insert(0, selectedValue);
        selectedAnimalSpecies = selectedValue;
      });
    }
  }

  Widget _buildAdditionalSpeciesOption(String optionText) {
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

void main() {
  runApp(const MaterialApp(
    home: CreateAnimalPage(),
  ));
}
