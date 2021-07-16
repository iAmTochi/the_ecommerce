import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;

  CustomInput({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFf5f5f5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "Hint Text ...",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ),
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
