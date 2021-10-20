import 'package:flutter/material.dart';


// Text Input Decoration
final textInputDecoration = InputDecoration(
  labelStyle: const TextStyle(color: Colors.black54),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.green, width: 1.5),
    borderRadius: BorderRadius.circular(10)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.green, width: 2.0),
    borderRadius: BorderRadius.circular(10)
  ),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(10)
  ),
  filled: true,
  fillColor: Colors.white,
);


// Button Style
final buttonStyle = ButtonStyle(
    elevation:  MaterialStateProperty.all(3.0)
);