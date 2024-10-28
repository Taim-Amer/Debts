import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:measure_size_builder/measure_size_builder.dart';
import 'package:taha_debts/features/home/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/models/country_model.dart';

class AnimatedTextFieldWidget extends StatefulWidget {
  const AnimatedTextFieldWidget({super.key, required this.deptScheduleController,});

  final DeptScheduleController deptScheduleController;

  @override
  State<AnimatedTextFieldWidget> createState() => _CustomPhoneCountryCodeState();
}

class _CustomPhoneCountryCodeState extends State<AnimatedTextFieldWidget> {
  double height = 0;
  bool isExpanded = false;

  final List<GlobalModel> countries = [
    GlobalModel(title: 'مساكن برزة'),
    GlobalModel(title: 'جديدة عرطوز'),
    GlobalModel(title: 'جديدة الفضل'),
    GlobalModel(title: 'المزة'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                final selectedCountry = countries.firstWhere((country) => country.code == widget.deptScheduleController.clientAddress.value, orElse: () => countries.first,);
                return Row(
                  children: [
                    8.horizontalSpace,
                    Icon(Icons.keyboard_arrow_down, color: const Color(0xFF353535), size: 28.h),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'ريف دمشق-ضاحية يوسف العظمة',
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
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return MeasureSizeBuilder(
                builder: (context, size) {
                  height = (size.height + 10.w) * countries.length;
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
          widget.deptScheduleController.clientAddress.value = countries[index].title;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            Radio<String>(
              value: countries[index].title,
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
            Text(countries[index].title),
            // 8.horizontalSpace,
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
