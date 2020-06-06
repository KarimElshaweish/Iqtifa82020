import 'dart:async';

import 'package:location/location.dart';
import 'package:lqtifa/Model/user_location.dart';

class LocationServices{
  UserLocation _userLocation;
  Location location=Location();
  StreamController<UserLocation>_locationController=StreamController<UserLocation>.broadcast();
  Stream<UserLocation> get locationSteam => _locationController.stream;

  LocationServices(){
    location.requestPermission().then((granted) {
      if(granted != null){
        location.onLocationChanged().listen((locationData) {
          if(locationData!=null){
            _locationController.add(UserLocation(locationData.latitude,locationData.longitude));
          }
        });
      }
    });
  }
  Future<UserLocation>getLocation()async{
    try{
      var userLocation=await location.getLocation();
      _userLocation=UserLocation(userLocation.latitude,userLocation.longitude);
    }catch(e){
      print('could not get the location :$e');
    }
    return _userLocation;
  }
}