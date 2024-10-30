import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:taha_debts/common/widgets/fields/animated_text_field_widget.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/models/country_model.dart';

class AnimatedSponsorAddressTextField extends StatefulWidget {
  const AnimatedSponsorAddressTextField({
    super.key,
    required this.deptScheduleController,
    required this.listItem,
  });

  final DeptScheduleController deptScheduleController;
  final List<GlobalModel> listItem;

  @override
  State<AnimatedSponsorAddressTextField> createState() =>
      _CustomPhoneCountryCodeState();
}

class _CustomPhoneCountryCodeState extends State<AnimatedSponsorAddressTextField> {
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
                      TTexts.addSponsor,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  8.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: const Icon(Icons.location_on, color: TColors.buttonPrimary),
                  ),
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
                    final selectedCountry = widget.listItem.firstWhere((country) => country.code == widget.deptScheduleController.clientAddress.value, orElse: () => widget.listItem.first);
                    return Row(
                      children: [
                        8.horizontalSpace,
                        Icon(Icons.keyboard_arrow_down, color: const Color(0xFF353535), size: 28.h),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "ريف دمشق-ضاحية يوسف العظمة",
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
          child: isExpanded ? Column(
            children: [
              const TextFieldWidget(
                title: TTexts.sponsorPhone,
                hint: "099742105",
                icon: Icons.phone_android,
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              AnimatedTextFieldWidget(
                deptScheduleController: widget.deptScheduleController,
                icon: Icons.location_on,
                title: "عنوان الكفيل",
                hint: "مساكن برزة",
                listItem: [
                  GlobalModel(title: 'مساكن برزة'),
                  GlobalModel(title: 'جديدة عرطوز'),
                  GlobalModel(title: 'جديدة الفضل'),
                  GlobalModel(title: 'المزة'),
                ],
              ),
            ],
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
