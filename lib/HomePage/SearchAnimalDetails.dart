import 'package:flutter/material.dart';

class SearchAnimalDetails extends StatefulWidget {
  final String imagePath;
  final String title;
  final String geninfo;

  SearchAnimalDetails(
      {required this.imagePath, required this.title, required this.geninfo});

  @override
  _SearchAnimalDetails createState() => _SearchAnimalDetails();
}

class _SearchAnimalDetails extends State<SearchAnimalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                // Handle back button press
                // Add your code here
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Handle edit button press
                  // Add your code here
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    FractionalTranslation(
                      translation: const Offset(0.0, -0.6),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(widget.imagePath),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(
                    0.0, -60.0), // Adjust the Y offset to move the text up
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildInfoBox('Mammal'),
                        const SizedBox(width: 8),
                        _buildInfoBox('Herbivore'),
                        const SizedBox(width: 8),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'General Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            widget.geninfo,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'The horse is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, close to Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BC',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Bar
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 36, 86, 38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          // Handle join farm button press
          Navigator.pop(context); // Close the modal sheet
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Start Your Farm',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget _buildInfoBox(String label) {
  return Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 242, 122),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    ),
  );
}
