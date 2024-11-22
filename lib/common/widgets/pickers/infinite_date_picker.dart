import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/date_picker_controller.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class InfiniteDatePicker extends StatelessWidget {
  const InfiniteDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Obx(() => ScrollDatePicker(
          selectedDate: DatePickerController.instance.selectedDate.value,
          maximumDate: DateTime(2026),
          locale: TCacheHelper.getData(key: 'locale') == 'en' ? const Locale('en') : const Locale('ar'),
          onDateTimeChanged: (DateTime value) {
            DatePickerController.instance.updateSelectedDate(value);
          },
        ),
      ),
    );
  }
}