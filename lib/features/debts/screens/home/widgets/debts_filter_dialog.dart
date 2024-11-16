import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/chips/choice_chip.dart';
import 'package:taha_debts/common/widgets/pickers/infinite_date_picker.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/reminder_tile.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_filter_continue_button.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class DebtsFilterDialog{

  static Future<dynamic> showDebtsFilterDialog() {
    final HomeController homeController = Get.find();

    return showModalBottomSheet(
      context: Get.context!,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: 500.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: TSizes.lg.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 700.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 24.w),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.close, color: const Color(0xFF6D6E72), size: 24.sp),
                        ),
                      ],
                    ),
                    TSizes.spaceBtwSections.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => TChoiceChip(
                            text: TranslationKey.kAll,
                            selected: homeController.isAllSelected.value,
                            onSelected: (value) => homeController.isAllSelected.value = value,
                          ),
                          ),
                        ),
                        TSizes.sm.horizontalSpace,
                        Expanded(
                          child: Obx(() => TChoiceChip(
                            text: TranslationKey.kTotalDebtors,
                            selected: homeController.isTotalDebtorsSelected.value,
                            onSelected: (value) => homeController.isTotalDebtorsSelected.value = value,
                          ),
                          ),
                        ),

                      ],
                    ),
                    TSizes.sm.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => TChoiceChip(
                            text: TranslationKey.kSettled,
                            selected: homeController.isSettledSelected.value,
                            onSelected: (value) => homeController.isSettledSelected.value = value,
                          ),
                          ),
                        ),
                        TSizes.sm.horizontalSpace,
                        Expanded(
                          child: Obx(() => TChoiceChip(
                            text: TranslationKey.kTotalReceived,
                            selected: homeController.isTotalReceivedSelected.value,
                            onSelected: (value) => homeController.isTotalReceivedSelected.value = value,
                          ),
                          ),
                        ),
                      ],
                    ),
                    TSizes.spaceBtwSections.verticalSpace,
                    const InfiniteDatePicker(),
                    // ReminderTile(
                    //   // icon: TImages.customizeReminder,
                    //   title: "من الأعلى إلى الأدنى",
                    //   value: 1,
                    //   showRadio: true,
                    //   // showArrowIcon: true,
                    //   selectedValueNotifier: ClientProfileController.instance.selectedValue,
                    // ),
                    // TSizes.lg.verticalSpace,
                    // ReminderTile(
                    //   // icon: TImages.customizeReminder,
                    //   title: "من الأدنى إلى الأعلى",
                    //   value: 2,
                    //   showRadio: true,
                    //   // showArrowIcon: true,
                    //   selectedValueNotifier: ClientProfileController.instance.selectedValue,
                    // ),
                    TSizes.spaceBtwSections.verticalSpace,
                    const HomeFilterContinueButton()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}