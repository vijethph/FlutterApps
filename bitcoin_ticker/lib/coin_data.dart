import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = "https://rest.coinapi.io/v1/exchangerate";
const apiKey = "1D0238A5-FEDF-42EB-86F4-AE838AE2C9E7";
//793ADE13-6E9F-4986-981C-D3A7C1F47DC4

class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var requestURL =
          Uri.parse("$coinAPIURL/$crypto/$selectedCurrency?apiKey=$apiKey");
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the API Request';
      }
    }
    print(cryptoPrices.values);
    return cryptoPrices;
  }
}
