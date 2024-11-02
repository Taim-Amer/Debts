import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/reminder_tile.dart';
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
  final ValueNotifier<int?> _selectedValueNotifier = ValueNotifier<int?>(null);

  @override
  void dispose() {
    _selectedValueNotifier.dispose();
    super.dispose();
  }

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
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.close, color: const Color(0xFF6D6E72), size: 24.sp),
                    ),
                    Text(
                      TTexts.reminderBy,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18, color: TColors.buttonPrimary),
                    ),
                    SizedBox(width: 24.w),
                  ],
                ),
                TSizes.spaceBtwSections.verticalSpace,
                ReminderTile(
                  icon: TImages.weakReminder,
                  title: TTexts.weakReminder,
                  showRadio: true,
                  value: 1,
                  selectedValueNotifier: _selectedValueNotifier,
                ),
                TSizes.spaceBtwItems.verticalSpace,
                ReminderTile(
                  icon: TImages.monthReminder,
                  title: TTexts.monthReminder,
                  showRadio: true,
                  value: 2,
                  selectedValueNotifier: _selectedValueNotifier,
                ),
                TSizes.spaceBtwItems.verticalSpace,
                const ReminderTile(
                  icon: TImages.customizeReminder,
                  title: TTexts.customizeReminder,
                  showArrowIcon: true,
                ),
                TSizes.spaceBtwSections.verticalSpace,
                SizedBox(
                  width: 270.w,
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(TTexts.tcontinue),
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
              Text(TTexts.collectionDate, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.buttonPrimary, fontWeight: FontWeight.w700)),
              5.verticalSpace,
              Text(TTexts.undefined, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}