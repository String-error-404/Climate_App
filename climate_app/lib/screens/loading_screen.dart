import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  // ! the init state calls once it is initalize it will not be called everytime like buildcontext.....
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = 'abc';
    double myMarginAsDouble;

    try {
      myMarginAsDouble = double.parse(myMargin);
    } catch (e) {
      print(e);
      // this will not get a exception error in the case we are assigning a new value................to it.......
      myMarginAsDouble = 30.0;
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
        color: Colors.red,
      ),
    );
  }
}
