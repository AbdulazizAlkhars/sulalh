import 'package:flutter/material.dart';

class VaccineEntryPage extends StatefulWidget {
  final List<String> vaccineNames;
  final List<DateTime?> firstDoseDates;
  final List<DateTime?> secondDoseDates;

  VaccineEntryPage({
    required this.vaccineNames,
    required this.firstDoseDates,
    required this.secondDoseDates,
  });

  @override
  _VaccineEntryPageState createState() => _VaccineEntryPageState();
}

class _VaccineEntryPageState extends State<VaccineEntryPage> {
  TextEditingController vaccineNameController = TextEditingController();
  DateTime? firstDoseDate;
  DateTime? secondDoseDate;

  @override
  void dispose() {
    vaccineNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFirstDose) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: isFirstDose
          ? firstDoseDate ?? DateTime.now()
          : secondDoseDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (isFirstDose) {
          firstDoseDate = selectedDate;
        } else {
          secondDoseDate = selectedDate;
        }
      });
    }
  }

  void _saveDataAndNavigateBack() {
    String newVaccineName = vaccineNameController.text;

    // Append the new data to the existing lists
    widget.vaccineNames.add(newVaccineName);
    widget.firstDoseDates.add(firstDoseDate);
    widget.secondDoseDates.add(secondDoseDate);

    // Navigate back to the VaccineListPage
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Entry Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Add Vaccination",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                "Vaccine",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: vaccineNameController,
                decoration: InputDecoration(
                  labelText: 'Vaccine Name',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        vaccineNameController.clear();
                      });
                    },
                  ),
                  hintText: 'Enter Vaccine Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
              Text('Add Date Of Vaccination:'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today,
                        color: const Color(0xFF245626)),
                    onPressed: () {
                      _selectDate(context, true);
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: firstDoseDate == null
                      ? 'Date Of Vaccination'
                      : '${firstDoseDate?.toLocal()}'.split(' ')[0],
                ),
              ),
              SizedBox(height: 20),
              Text('Add Next Date Of Vaccination:'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today,
                        color: const Color(0xFF245626)),
                    onPressed: () {
                      _selectDate(context, false);
                    },
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: secondDoseDate == null
                      ? 'Next Date Of Vaccination'
                      : '${secondDoseDate?.toLocal()}'.split(' ')[0],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Handle file upload logic here
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_open_outlined,
                        size: 35,
                      ),
                      const Text(
                        'Upload File, PDF, Jpeg, PNG',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Save data and navigate back to VaccineListPage
            _saveDataAndNavigateBack();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 36, 86, 38),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class VaccineListPage extends StatefulWidget {
  final List<String> vaccineNames;
  final List<DateTime?> firstDoseDates;
  final List<DateTime?> secondDoseDates;

  VaccineListPage({
    required this.vaccineNames,
    required this.firstDoseDates,
    required this.secondDoseDates,
  });

  @override
  _VaccineListPageState createState() => _VaccineListPageState();
}

class _VaccineListPageState extends State<VaccineListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine List Page'),
      ),
      body: ListView.builder(
        itemCount: widget.vaccineNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Vaccine Name: ${widget.vaccineNames[index]}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Dose Date: ${widget.firstDoseDates[index]}'),
                Text('Second Dose Date: ${widget.secondDoseDates[index]}'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the VaccineEntryPage and pass the existing data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VaccineEntryPage(
                vaccineNames: widget.vaccineNames,
                firstDoseDates: widget.firstDoseDates,
                secondDoseDates: widget.secondDoseDates,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VaccineListPage(
      vaccineNames: [],
      firstDoseDates: [],
      secondDoseDates: [],
    ),
  ));
}
