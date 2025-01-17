import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plumber_app/Cosntants/constants.dart';
import 'package:plumber_app/Widgets/Buttons.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  Future<void> _requestLocationPermission(BuildContext context) async {
    // First check if permission is already granted
    var permissionStatus = await Permission.location.status;

    while (!permissionStatus.isGranted) {
      if (permissionStatus.isDenied) {
        permissionStatus = await Permission.location.request();
      } else if (permissionStatus.isPermanentlyDenied) {
        // Show a dialog explaining why location is needed and direct to settings
        final bool shouldOpenSettings =
            await _showPermanentlyDeniedDialog(context);
        if (shouldOpenSettings) {
          await openAppSettings();
          // Wait for app to return and check permission again
          permissionStatus = await Permission.location.status;
        } else {
          // If user cancels, show the dialog again
          continue;
        }
      }
    }

    // Once permission is granted, check if location service is enabled
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      bool locationEnabled = false;
      while (!locationEnabled) {
        await _showEnableLocationDialog(context);
        locationEnabled = await Geolocator.isLocationServiceEnabled();
      }
    }

    // Only navigate when both permission is granted and location is enabled
    if (permissionStatus.isGranted &&
        await Geolocator.isLocationServiceEnabled()) {
      Navigator.pushReplacementNamed(context, '/map');
    }
  }

  Future<bool> _showPermanentlyDeniedDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Location Permission Required'),
          content: const Text(
            'Location permission is required to find service professionals near you. '
            'Please enable it in settings.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  Future<void> _showEnableLocationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Location Services Disabled'),
          content: const Text(
              'Please enable location services to use this feature.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () {
                Geolocator.openLocationSettings();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/location.png')),
              const SizedBox(height: 20),
              Text(
                'Allow location access?',
                style: blueheadingfont,
              ),
              const SizedBox(height: 20),
              const Text(
                'We need your location access to easily find American Service Specialist professionals around you.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              // _requestLocationPermission(context),
              const SizedBox(height: 30),
              Blueroundbutton(
                  height: 50, //TODO: need responsiveness with height and width,
                  width: 200,
                  text: "Enable Location",
                  ontap: () {
                    _requestLocationPermission(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
