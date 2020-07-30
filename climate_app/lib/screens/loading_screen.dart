import 'package:flutter/material.dart';
import 'package:climate_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '3aa31a13f1f5e346b24eab6a2306a41d';

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
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        // ! must modify to get the your orginal file...

        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    // ! if we print only responce it will only give the instance of Response

    // ? we have to trigger the the properites of response

    // * the status code is the when we are interacting with external servers , they need to a short and unified way of telling us what exactly happened when we interact with them...

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      var temperature = decodedData['main']['temp'];
      print(temperature);
      var conditon = decodedData['weather'][0]['id'];
      print(conditon);
      var cityName = decodedData['name'];
      print(cityName);
      //temp
      //id
      // cityname
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
