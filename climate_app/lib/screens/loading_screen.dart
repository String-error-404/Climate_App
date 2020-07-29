import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    print('build state got triggered');
    return Scaffold();
  }
}
// hastage
