import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);
  TextEditingController controller;
  String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            labelText: label,
            filled: true,
            border: InputBorder.none,
            fillColor: Colors.white),
      ),
    );
  }
}
