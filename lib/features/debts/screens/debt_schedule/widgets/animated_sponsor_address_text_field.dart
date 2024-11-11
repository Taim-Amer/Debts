import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/widgets/address_sponsor_animated_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class AnimatedSponsorAddressTextField extends StatefulWidget {
  const AnimatedSponsorAddressTextField({super.key});

  @override
  State<AnimatedSponsorAddressTextField> createState() => _CustomPhoneCountryCodeState();
}

class _CustomPhoneCountryCodeState extends State<AnimatedSponsorAddressTextField> {
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
                      TArabicTexts.addSponsor,
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
                color: dark ? TColors.dark : const Color(0xffE8E8E8),
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
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
                  ),
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          child: isExpanded ? Column(
            children: [
              TextFieldWidget(
                title: TArabicTexts.sponsorName,
                hint: "اسم الكفيل الكامل",
                icon: Icons.person,
                controller: DebtScheduleController.instance.sponsorNameController,
                keyboardType: TextInputType.name,
                validator: (value) => TValidator.validateEmptyText("اسم الكفيل", value),
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              TextFieldWidget(
                title: TArabicTexts.sponsorPhone,
                hint: "0000-000-000",
                icon: Icons.phone_android,
                controller: DebtScheduleController.instance.sponsorNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) => TValidator.validatePhoneNumber(value),
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              const AddressSponsorAnimatedContainer()
            ],
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
