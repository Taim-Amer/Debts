import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/common/widgets/pickers/infinite_date_picker.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class ReminderTile extends StatefulWidget {
  ReminderTile({
    super.key,
    this.icon,
    required this.title,
    this.showRadio = false,
    this.value,
    this.selectedValueNotifier,
    this.showArrowIcon = false,
  });

  final String? icon;
  final String title;
  final bool showRadio;
  int? value;
  ValueNotifier<int?>? selectedValueNotifier;
  final bool showArrowIcon;

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {

  Future<dynamic> showCustomizeReminderDialog() async{
    final dark = THelperFunctions.isDarkMode(context);
    // final isKeyboardVisible = await TDeviceUtils.isKeyboardVisible();
    return showModalBottomSheet(
      context: Get.context!,
      showDragHandle: false,
      isScrollControlled: true,
      backgroundColor: dark ? TColors.black : TColors.white,
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
                      SizedBox(width: 24.w),
                      Text(
                        TArabicTexts.customizeReminder,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18, color: TColors.buttonPrimary),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.close, color: const Color(0xFF6D6E72), size: 24.sp),
                      ),
                    ],
                  ),
                  TSizes.spaceBtwItems.verticalSpace,
                  const InfiniteDatePicker(),

                  // TSizes.spaceBtwSections.verticalSpace,
                  TRoundedContainer(
                    width: 350.w,
                    height: 165.h,
                    backgroundColor: dark ? TColors.dark : TColors.lightGrey,
                    showBorder: dark ? true : false,
                    child: TextFormField(
                      maxLines: 7,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: TArabicTexts.notationAdd,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),

                  TSizes.spaceBtwSections.verticalSpace,
                  SizedBox(height: 50.h, width: 350.w, child: ElevatedButton(onPressed: () => ClientProfileController.instance.selectReminder(), child: Text(TArabicTexts.tcontinue)),)
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
    return Row(
      children: [
        Row(
          children: [
            widget.icon != null ? SvgPicture.asset(widget.icon!) : const SizedBox(),
            widget.icon != null ? SizedBox(width: 8.w) : const SizedBox(),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18),
            ),

          ],
        ),
        const Spacer(),
        if (widget.showArrowIcon)
          IconButton(
            onPressed: (){
              widget.value = null;
              widget.selectedValueNotifier?.value = null;
              Get.back();
              showCustomizeReminderDialog();
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 16,
            ),
          ),
        if (widget.showRadio)
          Radio<int>(
            value: widget.value!,
            groupValue: widget.selectedValueNotifier!.value,
            onChanged: (newValue) {
              widget.selectedValueNotifier!.value = newValue;
            },
          ),

      ],
    );
  }
}