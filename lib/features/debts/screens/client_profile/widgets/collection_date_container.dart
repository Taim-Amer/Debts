import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/reminder_tile.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class CollectionDateContainer extends StatefulWidget {
  const CollectionDateContainer({super.key});

  @override
  CollectionDateContainerState createState() => CollectionDateContainerState();
}

class CollectionDateContainerState extends State<CollectionDateContainer> {

  Future<void> showCollectionDateBottomSheet() {
    return showModalBottomSheet(
      showDragHandle: false,
      context: Get.context!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 350.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: TSizes.lg.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 24.w),
                    Text(
                      TranslationKey.kReminderBy,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18, color: TColors.buttonPrimary),
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.close, color: const Color(0xFF6D6E72), size: 24.sp),
                    ),
                  ],
                ),
                TSizes.spaceBtwSections.verticalSpace,
                Expanded(
                  child: ReminderTile(
                    icon: TImages.weakReminder,
                    title: TranslationKey.kWeakReminder,
                    showRadio: true,
                    value: 1,
                    selectedValueNotifier: ClientProfileController.instance.selectedValue,
                  ),
                ),
                TSizes.spaceBtwItems.verticalSpace,
                Expanded(
                  child: ReminderTile(
                    icon: TImages.monthReminder,
                    title: TranslationKey.kMonthReminder,
                    showRadio: true,
                    value: 2,
                    selectedValueNotifier: ClientProfileController.instance.selectedValue,
                  ),
                ),
                TSizes.spaceBtwItems.verticalSpace,
                Expanded(
                  child: ReminderTile(
                    icon: TImages.customizeReminder,
                    title: TranslationKey.kCustomizeReminder,
                    value: 3,
                    showArrowIcon: true,
                    selectedValueNotifier: ClientProfileController.instance.selectedValue,
                  ),
                ),
                TSizes.spaceBtwSections.verticalSpace,
                SizedBox(
                  width: 270.w,
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: () => ClientProfileController.instance.selectReminder(),
                    child: Text(TranslationKey.kTcontinue),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showCollectionDateBottomSheet,
      child: TRoundedContainer(
        borderColor: TColors.grey,
        showBorder: true,
        backgroundColor: Colors.transparent,
        radius: 30.r,
        width: 270.h,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              Text(TranslationKey.kCollectionDate, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.buttonPrimary, fontWeight: FontWeight.w700)),
              5.verticalSpace,
              Text(TranslationKey.kUndefined, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey, fontWeight: FontWeight.w400)),
              // Text(TFormatter.formatData(TCacheHelper.getData(key: "collection_date").isNotEmpty
              //     ? DateTime.parse(TCacheHelper.getData(key: "collection_date"))
              //     : null), style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}