import 'package:flutter/material.dart';
import 'package:tradefair_app/constants.dart';
// for IOS Cupertino design
import 'package:flutter/cupertino.dart';
// to use only the platform class in dart io, which is for checking whether android or ios device
import 'dart:io' show Platform;

class CustomDropdown extends StatefulWidget {
  // onChange() will be defined in the converter page
  final Function onChange;

  const CustomDropdown(
      {required this.currencyList,
      required this.value,
      required this.onChange,
      super.key});

  final String value;
  final List<String> currencyList;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // Android Dropdown Menu
  Container androidDropdown() {
    // An empty list of DropdownMenuItems with Strings as children
    List<DropdownMenuItem<String>> dropdownItems = [];

    // Looping through the list to create a new DropdownMenu item each time
    for (String currency in widget.currencyList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }

    // The function returns a container with a DropdownMenu with items from looped list, and calls on the onChange function from the stateless widget each time the dropdown item is changed
    return Container(
      padding: const EdgeInsets.all(5),
      width: 75.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: kAccColor,
        border: Border.all(
          color: kPriColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: kDropdownTextStyle,
          borderRadius: BorderRadius.circular(20.0),
          dropdownColor: kAccColor,
          menuMaxHeight: 200,
          value: widget.value,
          items: dropdownItems,
          onChanged: (val) {
            // print("Value_AndroidDD_Dropdown file: $val");
            widget.onChange(val);
          },
          elevation: 100,
        ),
      ),
    );
  }

  // IOS Picker Menu
  Container iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in widget.currencyList) {
      pickerItems.add(
        Text(currency),
      );
    }
    return Container(
      height: 60,
      width: 70.0,
      decoration: BoxDecoration(
        color: kAccColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          // print("Value_IOS Picker_Dropdown file: ${widget.currencyList[selectedIndex]}");
          widget.onChange(widget.currencyList[selectedIndex]);
        },
        looping: true,
        children: pickerItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This checks if the device is running on IOS or Android, and paints the widget as needed
    return Platform.isIOS ? iOSPicker() : androidDropdown();
  }
}
