import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    fillColor: const Color(0xFFE8E9ED), // Background color as hex
    filled: true, // Enable the fill
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontWeight: FontWeight.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(.8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 0, color: Colors.transparent), // Hide outline color
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 0, color: Colors.transparent), // Hide outline color
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 0, color: Colors.transparent), // Hide outline color
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 1, color: Colors.red), // Keep error border visible
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 2, color: Colors.orange), // Keep focused error border visible
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    fillColor: const Color(0xFF2A2A2A), // Set a different background color for dark mode if needed
    filled: true, // Enable the fill for dark mode
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(.8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 0, color: Colors.transparent), // Hide outline color
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 0, color: Colors.transparent), // Hide outline color
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 0, color: Colors.transparent), // Hide outline color
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 1, color: Colors.red), // Keep error border visible
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), // Increased border radius
      borderSide: const BorderSide(width: 2, color: Colors.orange), // Keep focused error border visible
    ),
  );
}
