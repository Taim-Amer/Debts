import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:measure_size_builder/measure_size_builder.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key, required this.hint, this.title, this.icon, required this.listItem});

  final String hint;
  final List<Data> listItem;
  final String? title;
  final IconData? icon;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  double height = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
                color: dark ? TColors.dark : const Color(0xffE8E8E8),
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
                  child: Row(
                    children: [
                      8.horizontalSpace,
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF353535), size: 28.h),
                      ),
                      Expanded(
                        child: Obx(() {
                          // Display selected title instead of hint
                          return TextFormField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: DebtScheduleController.instance.clientAddress.value ?? widget.hint,
                            ),
                            decoration: InputDecoration(
                              hintText: null,  // Remove hintText
                              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            cursorColor: TColors.buttonPrimary,
                            keyboardType: TextInputType.phone,
                          );
                        }),
                      ),
                    ],
                  ),
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
            color: dark ? TColors.dark : TColors.lightGrey,
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
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          // Update clientAddress with the selected title
          DebtScheduleController.instance.clientAddress.value = widget.listItem[index].title!;
          isExpanded = false; // Close the dropdown after selection
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            Radio<String>(
              value: widget.listItem[index].title!,
              groupValue: DebtScheduleController.instance.clientAddress.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  DebtScheduleController.instance.clientAddress.value = value!;
                  isExpanded = false;
                });
              },
            ),
            const Spacer(),
            16.horizontalSpace,
            Text(widget.listItem[index].title!),
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }

}
