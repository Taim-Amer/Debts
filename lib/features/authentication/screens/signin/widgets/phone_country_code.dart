import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:measure_size_builder/measure_size_builder.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/models/country_model.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class PhoneCountryCode extends StatefulWidget {
  const PhoneCountryCode({super.key});

  @override
  State<PhoneCountryCode> createState() => _CustomPhoneCountryCodeState();
}

class _CustomPhoneCountryCodeState extends State<PhoneCountryCode> {
  double height = 0;
  bool isExpanded = false;

  final List<GlobalModel> countries = [
    GlobalModel(code: "+963",title: "الاردن", svg: TImages.jordan),
    GlobalModel(code: '+966', title: 'العراق', svg: TImages.saudi),
    // GlobalModel(code: '+974', title: 'قطر', svg: TImages.qatar),
    // GlobalModel(code: '+20', title: 'مصر', svg: TImages.egypt),
    // GlobalModel(code: '+961', title: 'لبنان', svg: TImages.lebanon),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: dark ? TColors.dark : const Color(0xffE8E8E8),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Obx(() {
                    final selectedCountry = countries.firstWhere(
                          (country) => country.code == SignInController.instance.countryCode.value,
                      orElse: () => countries.first,
                    );
                    return Row(
                      children: [
                        8.horizontalSpace,
                        Icon(Icons.keyboard_arrow_down, color: dark ? TColors.lightGrey : const Color(0xFF353535), size: 28.h),
                        Expanded(
                          child: TextFormField(
                            validator: (value) => TValidator.validatePhoneNumber(value),
                            controller: SignInController.instance.phoneController,
                            decoration: InputDecoration(
                              hintText: '000_000_000',
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                              border: InputBorder.none,
                            ),
                            cursorColor: TColors.buttonPrimary,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        16.horizontalSpace,
                        Container(height: 17.h, width: 1, color: dark ? TColors.lightGrey : Colors.black),
                        8.horizontalSpace,
                        Text('(${selectedCountry.code})'),
                        8.horizontalSpace,
                        Image.asset(selectedCountry.svg!, height: 24.h, width: 24.w),
                        8.horizontalSpace,
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
          16.verticalSpace,
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isExpanded ? height : 0,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: dark ? TColors.dark :TColors.lightGrey,
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

  GestureDetector countryCodeItemBuilder(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          SignInController.instance.countryCode.value = countries[index].code!;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            16.horizontalSpace,
            Image.asset(countries[index].svg!, height: 24.h, width: 24.w),
            16.horizontalSpace,
            Text(countries[index].title),
            8.horizontalSpace,
            Text('(${countries[index].code})', textDirection: TextDirection.ltr),
            const Spacer(),
            Radio<String>(
              value: countries[index].code!,
              groupValue: SignInController.instance.countryCode.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  SignInController.instance.countryCode.value = value!;
                  isExpanded = false;
                  TCacheHelper.saveData(key: "code", value: value);
                });
                },
            ),
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
