import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LatLng _selectedLocation = const LatLng(28.6139, 77.2090); // Default location
  String _address = '';
  Set<Marker> _markers = {};

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _address =
              '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        });
      }
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  void _updateMarker(LatLng position) {
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId('selectedLocation'),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Choose Location'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 1,
            ),
            onMapCreated: (controller) => _mapController = controller,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            mapType: MapType.satellite,
            onTap: (position) {
              setState(() {
                _selectedLocation = position;
              });
              _updateMarker(position);
              _getAddressFromLatLng(position);
            },
            markers: _markers,
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     margin: const EdgeInsets.all(16),
          //     padding: const EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(12),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.1),
          //           blurRadius: 10,
          //           offset: const Offset(0, -5),
          //         ),
          //       ],
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         const Text(
          //           'Selected Location',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 16,
          //           ),
          //         ),
          //         const SizedBox(height: 8),
          //         Text(
          //           _address.isEmpty
          //               ? 'Tap on map to select location'
          //               : _address,
          //           style: TextStyle(
          //             color: Colors.grey[600],
          //             fontSize: 14,
          //           ),
          //         ),
          //         const SizedBox(height: 16),
          //         SizedBox(
          //           width: double.infinity,
          //           height: 45,
          //           child: ElevatedButton(
          //             onPressed: _address.isEmpty
          //                 ? null
          //                 : () {
          //                     // Return selected location and address
          //                     Navigator.pop(context, {
          //                       'location': _selectedLocation,
          //                       'address': _address,
          //                     });
          //                   },
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: Colors.blue,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(8),
          //               ),
          //             ),
          //             child: const Text(
          //               'Confirm Location',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
