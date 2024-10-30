import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:measure_size_builder/measure_size_builder.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/models/country_model.dart';

class AnimatedTextFieldWidget extends StatefulWidget {
  const AnimatedTextFieldWidget({super.key, required this.deptScheduleController, required this.hint, required this.listItem, this.title, this.icon,});

  final DeptScheduleController deptScheduleController;
  final String hint;
  final List<GlobalModel> listItem;
  final String? title;
  final IconData? icon;

  @override
  State<AnimatedTextFieldWidget> createState() => _CustomPhoneCountryCodeState();
}

class _CustomPhoneCountryCodeState extends State<AnimatedTextFieldWidget> {
  double height = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      widget.title!,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.icon != null) ...[
                    8.horizontalSpace,
                    Icon(widget.icon, color: TColors.buttonPrimary),
                  ],
                ],
              ),
            ),
            12.verticalSpace,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffE8E8E8),
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Obx(() {
                    final selectedCountry = widget.listItem.firstWhere((country) => country.code == widget.deptScheduleController.clientAddress.value, orElse: () => widget.listItem.first,);
                    return Row(
                      children: [
                        8.horizontalSpace,
                        Icon(Icons.keyboard_arrow_down, color: const Color(0xFF353535), size: 28.h),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: widget.hint,
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            cursorColor: TColors.buttonPrimary,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? height : 0,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: TColors.lightGrey,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listItem.length,
            itemBuilder: (context, index) {
              return MeasureSizeBuilder(
                builder: (context, size) {
                  height = (size.height + 10.w) * widget.listItem.length;
                  return countryCodeItemBuilder(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  InkWell countryCodeItemBuilder(int index) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          widget.deptScheduleController.clientAddress.value = widget.listItem[index].title;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            Radio<String>(
              value: widget.listItem[index].title,
              groupValue: widget.deptScheduleController.clientAddress.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  widget.deptScheduleController.clientAddress.value = value!;
                  isExpanded = false;
                });
              },
            ),
            const Spacer(),
            16.horizontalSpace,
            Text(widget.listItem[index].title),
            // 8.horizontalSpace,
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
