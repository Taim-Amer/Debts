import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/common/widgets/pickers/infinite_date_picker.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class ReminderTile extends StatefulWidget {
  const ReminderTile({
    super.key,
    required this.icon,
    required this.title,
    this.showRadio = false,
    this.value,
    this.selectedValueNotifier,
    this.showArrowIcon = false,
  });

  final String icon;
  final String title;
  final bool showRadio;
  final int? value;
  final ValueNotifier<int?>? selectedValueNotifier;
  final bool showArrowIcon;

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {

  Future<dynamic> showCustomizeReminderDialog() {
    final dark = THelperFunctions.isDarkMode(context);
    return showModalBottomSheet(
      context: Get.context!,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (context){
        return SizedBox(
          height: 570.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: TSizes.lg.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.close, color: const Color(0xFF6D6E72), size: 24.sp),
                      ),
                      Text(
                        TTexts.customizeReminder,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18, color: TColors.buttonPrimary),
                      ),
                      SizedBox(width: 24.w),
                    ],
                  ),
                  TSizes.spaceBtwItems.verticalSpace,
                  const InfiniteDatePicker(),
                  TSizes.spaceBtwSections.verticalSpace,
                  TRoundedContainer(
                    width: 350.w,
                    height: 165.h,
                    backgroundColor: dark ? TColors.dark : TColors.lightGrey,
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        hintText: TTexts.notationAdd,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TSizes.spaceBtwSections.verticalSpace,
                  SizedBox(height: 50.h, width: 350.w, child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.tcontinue)),)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.selectedValueNotifier?.addListener(_updateSelected);
  }

  @override
  void dispose() {
    widget.selectedValueNotifier?.removeListener(_updateSelected);
    super.dispose();
  }

  void _updateSelected() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          if (widget.showRadio)
            Radio<int>(
              value: widget.value!,
              groupValue: widget.selectedValueNotifier!.value,
              onChanged: (newValue) {
                widget.selectedValueNotifier!.value = newValue;
              },
            ),
          if (widget.showArrowIcon)
            IconButton(
              onPressed: (){
                Get.back();
                showCustomizeReminderDialog();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 16,
              ),
            ),
          const Spacer(),
          Row(
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(widget.icon),
            ],
          ),
        ],
      ),
    );
  }
}