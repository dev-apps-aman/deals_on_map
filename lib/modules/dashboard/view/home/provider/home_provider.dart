import 'package:deals_on_map/service/api_logs.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeProvider extends ChangeNotifier {
  String currentLocation = 'Fetching location...';

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      getCurrentLocation();
    } else {
      currentLocation = 'Location permission denied';
      notifyListeners();
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentLocation = 'Location services are disabled';
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        currentLocation = 'Location permission denied';
        notifyListeners();
        return;
      }
    }
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    await getAddressFromCoordinates(position.latitude, position.longitude);
    notifyListeners();
  }

  Future<void> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        currentLocation =
            '${place.street}, ${place.name}, ${place.subLocality}, ${place.locality}, ${place.postalCode}';
        Log.console(currentLocation);
      } else {
        currentLocation = 'Address not found';
      }
    } catch (e) {
      currentLocation = 'Failed to get address';
    }

    notifyListeners();
  }
}
