import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/date_picker_controller.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class InfiniteDatePicker extends StatelessWidget {
  const InfiniteDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: Obx(() => ScrollDatePicker(
          selectedDate: DatePickerController.instance.selectedDate.value,
          locale: const Locale('en'),
          onDateTimeChanged: (DateTime value) {
            DatePickerController.instance.updateSelectedDate(value);
          },
        ),
      ),
    );
  }
}