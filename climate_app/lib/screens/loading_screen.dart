import 'package:flutter/material.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:climate_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate_app/services/weather.dart';

// ! it is ...
// ! to able go to a empty json line item use index value

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  double longitude;
  double latitude;

  // ! the init state calls once it is initalize it will not be called everytime like buildcontext.....

  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // because the getcurrent location is future

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    //temp
    //id
    // cityname
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
