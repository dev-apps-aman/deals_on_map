import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationProvider extends ChangeNotifier {
  String currentLocation = 'Fetching location...';

  String fullAddress = '';
  String country = '';
  String state = '';
  String district = '';
  String city = '';
  String colony = '';
  String street = '';
  String mainRoad = '';
  String houseNumber = '';
  String landmark = '';
  String postalCode = '';

  // Method to get the current location and fetch address
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if Location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentLocation = 'Location services are disabled';
      notifyListeners();
      return;
    }

    // Check for Location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Handle permission denial
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      currentLocation = 'Location permission denied';
      notifyListeners();
      return;
    }

    // Create LocationSettings for desired accuracy
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    // Fetch Current Location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
    await getAddressFromCoordinates(position.latitude, position.longitude);
  }

  // Method to fetch address from coordinates
  Future<void> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        country = place.country ?? 'Unknown';
        state = place.administrativeArea ?? 'Unknown';
        district = place.subAdministrativeArea ?? 'Unknown';
        city = place.locality ?? 'Unknown';
        colony = place.subLocality ?? 'Unknown';
        street = place.street ?? 'Unknown';
        mainRoad = place.thoroughfare ?? 'Unknown';
        houseNumber = place.subThoroughfare ?? 'Unknown';
        landmark = place.name ?? 'Unknown';
        postalCode = place.postalCode ?? 'Unknown';

        currentLocation =
            '$street, $city, $district, $state, $country - $postalCode'.trim();
        fullAddress =
            '$street, $city, $district, $state, $country - $postalCode'.trim();
      } else {
        currentLocation = 'Address not found';
      }
    } catch (e) {
      currentLocation = 'Failed to get address';
    }

    notifyListeners();
  }
}
