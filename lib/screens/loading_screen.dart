// import 'dart:js';
import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services//location.dart';
import 'package:clima/services/networking.dart';


const String apiKey = '32420912e937e1f552671fd6fc0109c9';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
   double latitude;
   double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
   Location location = new Location();
   await location.getCurrentLocation();
   latitude = location.latitude;
   longitude = location.longitude;

   NetworkingHelper networkingHelper = new NetworkingHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
  var  weatherData = await networkingHelper.getData();

   Navigator.push(context, MaterialPageRoute(builder: (context){
     return LocationScreen();
   }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
