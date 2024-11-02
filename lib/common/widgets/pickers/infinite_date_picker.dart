import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class InfiniteDatePicker extends StatefulWidget {
  const InfiniteDatePicker({super.key});

  @override
  State<InfiniteDatePicker> createState() => _InfiniteDatePickerState();
}

class _InfiniteDatePickerState extends State<InfiniteDatePicker> {
  DateTime focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      firstDate: DateTime(2020, 1, 1),
      focusDate: focusDate,
      lastDate: DateTime.now(),
      onDateChange: (selectedDate) {
        setState(() {
          focusDate = selectedDate;
        });
      },
    );
  }
}
