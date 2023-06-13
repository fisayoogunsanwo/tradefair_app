import 'package:tradefair_app/services/api_client.dart';

// OpenExchange API key
const apiKey = '5a8f949a8bca456a9d95ee2e9ba1587d';

const openExchangeURL = 'openexchangerates.org';
const openExchangePath = '/api/latest.json';

class ExchangeModel {
  Future<dynamic> getRates(String baseCurrency, String exchangeCurrency) async {
    var url = Uri.https(
      openExchangeURL,
      openExchangePath,
      {
        'app_id': apiKey,
        // Change base to 'baseCurrency' when you get API that can change base currency
        'base': 'USD',
        'symbols': [exchangeCurrency]
      },
    );

    ApiClient apiClient = ApiClient(url);
    var exchangeData = await apiClient.getData();
    // print("the url is ${url}");
    // print("The exchange rate is " +exchangeData['rates'][exchangeCurrency].toString());
    return exchangeData['rates'][exchangeCurrency];
  }
}
