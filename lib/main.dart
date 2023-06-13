import 'package:flutter/material.dart';
import 'converter_page.dart';
import 'constants.dart';

void main() {
  runApp(const TradefairApp());
}

class TradefairApp extends StatelessWidget {
  const TradefairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: kPriColor),
        primaryColor: kAccColor,
        
        
        // scaffoldBackgroundColor: Colors.blueGrey
      ),
      home: const ConverterPage(),
    );
  }
}
