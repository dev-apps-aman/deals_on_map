
import 'package:deals_on_map/core/common_widgets/util.dart';
import 'package:deals_on_map/service/api_logs.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationProvider extends ChangeNotifier {
  String currentLocation = 'Fetching location...';
  String country = '';
  String state = '';
  String district = '';
  String city = '';
  String postalCode = '';

  bool locationPermissionGranted = false;

  Future<bool> requestLocationPermission(BuildContext context) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      Log.console("🔍 Location Service Enabled: $serviceEnabled");

      if (!serviceEnabled) {
        await showPermissionDialog(
          context,
          'Location Services Disabled',
          'Please enable GPS to fetch location.',
        );
        return false;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      Log.console("🔍 Initial Permission Status: $permission");

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        Log.console("🔍 After Request Permission Status: $permission");

        if (permission == LocationPermission.denied) {
          await showPermissionDialog(
            context,
            'Permission Denied',
            'Location permission is required.',
          );
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        
        await showPermissionDialog(
          context,
          'Permission Denied Forever',
          'Go to settings and enable location permission manually.',
        );
        return false;
      }

      Log.console("✅ Permission Granted!");
      locationPermissionGranted = true;
      return true;
    } catch (e) {
      Log.console("🚨 Error in location permission: $e");
      await showPermissionDialog(
          context, "Error", "Failed to get location permission.");
      return false;
    }
  }

  Future<bool> getCurrentLocation(BuildContext context) async {
    if (!locationPermissionGranted) {
      Log.console("🔴 Location permission not granted.");
      return false;
    }

    try {
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      Log.console(
          "✅ Location Fetched: ${position.latitude}, ${position.longitude}");
      await getAddressFromCoordinates(
          context, position.latitude, position.longitude);
      return true;
    } catch (e) {
      Log.console("🚨 Error fetching location: $e");
      errorToast(context, "Failed to get location.");
      return false;
    }
  }

  Future<void> getAddressFromCoordinates(
      BuildContext context, double latitude, double longitude) async {
    try {
      Log.console("🔍 Fetching address for: $latitude, $longitude");

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        country = place.country ?? 'Unknown';
        state = place.administrativeArea ?? 'Unknown';
        district = place.subAdministrativeArea ?? 'Unknown';
        city = place.locality ?? 'Unknown';
        postalCode = place.postalCode ?? 'Unknown';

        currentLocation = "$city, $district, $state, $country - $postalCode";
        Log.console("✅ Address Fetched: $currentLocation");
      } else {
        Log.console("⚠️ No address found.");
        currentLocation = 'Address not found';
      }
    } catch (e) {
      Log.console("🚨 Geocoding Failed: $e");
      currentLocation = 'Failed to get address';
    }

    notifyListeners();
  }
}

Future<void> showPermissionDialog(
    BuildContext context, String title, String content) async {
  if (!context.mounted) return;

  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
