import 'dart:async';

import "package:location/location.dart";
import "package:gps_onichan/datamodels/user_location.dart";

class LocationService {
  //Keep track of current location
  UserLocation _currentLocation;
  Location location = Location();
  //Continuosly emit location updates
  StreamController<UserLocation> _locationController =
    StreamController<UserLocation>.broadcast();

  LocationService(){
    location.requestPermission().then((granted){
      if(granted){
        location.onLocationChanged().listen((locationData){
          if(locationData != null){
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,      
      );
    }catch (e) {
      print('Unable to get location error: $e');
    }
    return _currentLocation;
  }

}