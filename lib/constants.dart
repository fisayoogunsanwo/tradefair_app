import 'package:flutter/material.dart';

// App Colors
const kAccColor = Color(0xFFC2D7FF);
const kSecColor = Color(0xFF0043B8);
const kPriColor = Color(0xFF002D7A);
const kTerColor = Color(0xFF0A1128);
const kExchangeRateColor = Color.fromARGB(255, 176, 195, 231);

const kAppBarTitle = Text('Tradefair', style: TextStyle(color: kAccColor, 
fontWeight: FontWeight.bold,
                    fontFamily: 'DeliusSwashCaps'),);

const kNumberTextStyle = TextStyle(
  color: kTerColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
                    fontFamily: 'DeliusSwashCaps'
);

const kDropdownTextStyle =  TextStyle(
            fontSize: 14.0,
            color: kTerColor,
            fontFamily: 'DeliusSwashCaps',
            
          );

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: kAccColor,
  hintText: holderText,
  hintStyle: TextStyle(color: Colors.grey,
  fontWeight: FontWeight.bold,
                    fontFamily: 'DeliusSwashCaps'),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide.none),
);

const kHeadingStyle = TextStyle(color: kTerColor, 
fontWeight: FontWeight.bold,
                    fontFamily: 'DeliusSwashCaps');

const kRateTextStyle = TextStyle(
  color: kPriColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'DeliusSwashCaps',
);

const holderText = '0.00';

const kPadding5 = EdgeInsets.all(5.0);

const kBodyFontFam = '';

// "From" Currencies list
const List<String> baseCurrenciesList = [
  
  'USD',
  'EUR',
  'GBP',
];

// "To" Currencies list
const List<String> exchangeCurrenciesList = [
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
