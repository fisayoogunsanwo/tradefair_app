import 'package:flutter/material.dart';
import 'package:tradefair_app/components/float_divider.dart';
import 'package:tradefair_app/services/exchange.dart';
import 'components/drop_down.dart';
import 'constants.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  late dynamic rate = 0;

  // starting Values for currencies
  String baseCurrency = "USD";
  String exchangeCurrency = "AUD";

  // An instance of the API client model
  ExchangeModel exchange = ExchangeModel();

// Function to call method getRates() from API and wait for response, and save in rate
  Future<dynamic> getRatesList() async {
    rate = await exchange.getRates(baseCurrency, exchangeCurrency);
  }

  // Text editing controller for the 2 TextFields
  late final TextEditingController _fromAmount = TextEditingController();
  final TextEditingController _result = TextEditingController();

  @override
  void initState() {
    super.initState();
    getRatesList();
  }

// Disposing The controllers for the Text fields as the app ends
  @override
  void dispose() {
    _fromAmount.dispose();
    _result.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size unitHeightValue = MediaQuery.of(context).size * 0.01;
    double kBaseFontSize = 8 * unitHeightValue.height;

    return Scaffold(
      appBar: AppBar(
        title: kAppBarTitle,
      ),
      backgroundColor: kAccColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kBaseFontSize * 0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Heading Text
                Text(
                  "Currency Converter",
                  style: kHeadingStyle.copyWith(
                    fontSize: kBaseFontSize * 0.3,
                  ),
                ),

                // Currency input cards container
                SizedBox(
                  height: kBaseFontSize * 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Currency input card 1
                      Container(
                        padding: EdgeInsets.all(kBaseFontSize * 0.15),
                        decoration: BoxDecoration(
                          color: kSecColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // First half of 1st Currency row
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: kBaseFontSize * 0.4,
                                    backgroundImage: AssetImage(
                                        "assets/flags/${baseCurrency}.png"),
                                  ),
                                  // Space between
                                  SizedBox(
                                    width: kBaseFontSize * 0.05,
                                  ),
                                  // need dynamic input here, and naming of first and second country

                                  CustomDropdown(
                                    currencyList: baseCurrenciesList,
                                    value: baseCurrency,
                                    onChange: (val) async {
                                      rate = await exchange.getRates(
                                          baseCurrency, exchangeCurrency);
                                      baseCurrency = val;
                                      // print(val);
                                      // print('Rate: ${rate}');
                                      // print('Base Currency: ' + baseCurrency);
                                    },
                                  ),
                                ],
                              ),

                              //Second half of currency row
                              Container(
                                width: kBaseFontSize * 3,
                                padding: kPadding5,
                                child: TextField(
                                  controller: _fromAmount,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  style: kNumberTextStyle,
                                  textAlign: TextAlign.right,
                                  decoration: kTextFieldInputDecoration,
                                  // What happens when number is changed
                                  onChanged: (fromAmount) {
                                    // print("The number in text field is " + fromAmount);
                                    setState(() {
                                      try {
                                        _result.text =
                                            (rate * double.parse(fromAmount))
                                                .toStringAsFixed(2);
                                      } catch (e) {
                                        // print('Set State Error: $e');
                                      }
                                    });
                                    // print('The result: ${_result.text}');
                                  },
                                ),
                              )
                              //End of First Currency Card row
                            ]),
                      ),
                      //End of CurrencyInputCard 1

                      // Space between
                      SizedBox(
                        height: kBaseFontSize * 0.3,
                      ),

                      // Icon and Divider Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatDivider(
                              baseSize: kBaseFontSize,
                              indent: 0,
                              endIndent: 0.3),
                          FloatingActionButton(
                            enableFeedback: false,
                            onPressed: () {
                              null;
                            },
                            backgroundColor: kSecColor,
                            child: const Icon(Icons.wifi_protected_setup_sharp),
                            // elevation: 0,
                          ),
                          FloatDivider(
                              baseSize: kBaseFontSize,
                              indent: 0.3,
                              endIndent: 0),
                        ],
                      ),

                      // Space between
                      SizedBox(
                        height: kBaseFontSize * 0.3,
                      ),

                      // Currency Input Card 2
                      Container(
                        padding: EdgeInsets.all(kBaseFontSize * 0.15),
                        decoration: BoxDecoration(
                          color: kSecColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // First half of 2st Currency row
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: kBaseFontSize * 0.4,
                                    backgroundImage: AssetImage(
                                        "assets/flags/${exchangeCurrency}.png"),
                                  ),
                                  // Space between
                                  SizedBox(
                                    width: kBaseFontSize * 0.05,
                                  ),

                                  CustomDropdown(
                                    currencyList: exchangeCurrenciesList,
                                    value: exchangeCurrency,
                                    onChange: (val) async {
                                      exchangeCurrency = val;
                                      rate = await exchange.getRates(
                                          baseCurrency, exchangeCurrency);
                                      // print(rate);
                                      // print('Exchange Currency: ' + exchangeCurrency);
                                      setState(() {
                                        try {
                                          _result.text = (rate *
                                                  double.parse(
                                                      _fromAmount.text))
                                              .toStringAsFixed(2);
                                        } catch (e) {
                                          // print('Set State Error: $e');
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),

                              //Second half of currency row
                              Container(
                                width: kBaseFontSize * 3,
                                padding: kPadding5,
                                child: TextField(
                                  controller: _result,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  style: kNumberTextStyle,
                                  textAlign: TextAlign.right,
                                  decoration: kTextFieldInputDecoration,
                                  onChanged: (result) {
                                    // print("The number in result field is " + result);
                                    setState(() {
                                      try {
                                        _fromAmount.text =
                                            (double.parse(result) / rate)
                                                .toStringAsFixed(2);
                                      } catch (e) {
                                        // print('Set State Error: $e');
                                      }
                                    });

                                    // print('The result: ${_fromAmount.text}');
                                  },
                                ),
                              )
                              //End of First Currency Card row
                            ]),
                      ),
                      //End of CurrencyInputCard 2
                    ],
                  ),
                ),

                // Indicative Exchange Rate Container
                Container(
                  padding: EdgeInsets.all(kBaseFontSize * 0.3),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kExchangeRateColor,
                    borderRadius: BorderRadius.circular(
                        kBaseFontSize), // gradient: Gradient(colors: [Colors.black, Colors.white,Colors.green]),
                  ),
                  child: Column(
                    children: [
                      const Text("Indicative Exchange Rate",
                          style: kRateTextStyle),
                      Text(
                          "1 $baseCurrency =  ${rate.toStringAsFixed(4)} $exchangeCurrency",
                          style: kRateTextStyle.copyWith(
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: kPriColor,
      //   padding: EdgeInsets.all(kBaseFontSize * 0.15),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor: kSecColor,
      //     child: IconButton(
      //       tooltip: 'Dark Mode',
      //       icon: bottomIcon,
      //       onPressed: () {
      //         setState(() { bottomIcon = Icon(Icons.dark_mode_outlined);
      //         });
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
