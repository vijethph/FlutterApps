import 'package:http/http.dart' as http;
import 'dart:convert';

//"https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey"

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
      // var longitude = decodedData['coord']['lon'];
      // var weatherDescription = decodedData['weather'][0]['description'];
      //
      // var temperature = decodedData['main']['temp'];
      // var condition = decodedData['weather'][0]['id'];
      // var cityName = decodedData['name'];
    } else {
      print(response.statusCode);

      return '0';
    }
  }
}
