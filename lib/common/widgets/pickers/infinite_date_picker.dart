import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class InfiniteDatePicker extends StatefulWidget {
  const InfiniteDatePicker({super.key});

  @override
  State<InfiniteDatePicker> createState() => _InfiniteDatePickerState();
}

class _InfiniteDatePickerState extends State<InfiniteDatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ScrollDatePicker(
        selectedDate: _selectedDate,
        locale: const Locale('en'),
        onDateTimeChanged: (DateTime value) {
          setState(() {
            _selectedDate = value;
          });
        },
      ),
    );
  }
}
