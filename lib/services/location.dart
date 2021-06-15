import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low,
      forceAndroidLocationManager: true,);

    latitude = position.latitude;
    longitude = position.longitude;
  }
}