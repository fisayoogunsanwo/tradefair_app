import 'package:flutter/material.dart';
import 'package:tradefair_app/constants.dart';

class FloatDivider extends StatelessWidget {
  const FloatDivider({super.key, required this.baseSize, required this.indent, required this.endIndent,
  });

  final double baseSize;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
            height: 20,
            thickness: baseSize * 0.02,
            indent: baseSize * indent,
            endIndent: baseSize * endIndent,
            color: kSecColor,
          ),
    );
  }
}