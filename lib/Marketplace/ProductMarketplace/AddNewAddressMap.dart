import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressSelectionPage extends StatefulWidget {
  @override
  _AddressSelectionPageState createState() => _AddressSelectionPageState();
}

class _AddressSelectionPageState extends State<AddressSelectionPage> {
  late LatLng _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Address'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {});
        },
        onTap: (LatLng location) {
          setState(() {
            _selectedLocation = location;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the selected location
          // For example, you can pass it back to the previous screen
          Navigator.pop(context, _selectedLocation);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
