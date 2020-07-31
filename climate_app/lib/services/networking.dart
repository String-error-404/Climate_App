import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    // ! must modify to get the your orginal file...

    // ! if we print only responce it will only give the instance of Response

    // ? we have to trigger the the properites of response

    // * the status code is the when we are interacting with external servers , they need to a short and unified way of telling us what exactly happened when we interact with them...

    if (response.statusCode == 200) {
      String data = response.body;
      return  jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
