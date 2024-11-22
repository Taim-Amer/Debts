import 'package:get/get.dart';

class DatePickerController extends GetxController {
  static DatePickerController get instance => Get.find();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime date) {
    print('==========================');
    selectedDate.value = date;
  }
}