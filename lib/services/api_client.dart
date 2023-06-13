import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiClient {
  ApiClient(this.currencyUrl);

  Uri currencyUrl;

  Future getData() async {
    http.Response response = await http.get(currencyUrl);

    if (response.statusCode == 200) {
      String data = response.body;

      return convert.jsonDecode(data);
    } else {
      throw Exception ("Failed to connect to API with ${response.statusCode} code error");
    }
  }
}

