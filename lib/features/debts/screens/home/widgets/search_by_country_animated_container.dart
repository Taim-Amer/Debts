import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/logging/logger.dart';

class SearchByCountryAnimatedContainer extends StatefulWidget {
  const SearchByCountryAnimatedContainer({super.key});

  @override
  State<SearchByCountryAnimatedContainer> createState() => _SearchByCountryAnimatedContainerState();
}

class _SearchByCountryAnimatedContainerState extends State<SearchByCountryAnimatedContainer> {
  bool isExpanded = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(() => AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      child: HomeController.instance.isExpanded.value ? Column(
        children: [
          Column(
            children: [
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: dark ? TColors.dark : const Color(0xFFE8E9ED),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    children: [
                      8.horizontalSpace,
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                            isExpanded = !isExpanded;
                          });
                          await DebtScheduleController.instance.getRegions();
                          setState(() {
                            isLoading = false;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 28.h),
                      ),
                      Expanded(
                        child: Obx(() {
                          return TextFormField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: DebtScheduleController.instance.sponsorAddress.value,
                            ),
                            decoration: InputDecoration(
                              hintText: null,
                              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                              border: InputBorder.none,
                              suffixIcon: const Icon(Icons.location_on)
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
            ],
          ),
          16.verticalSpace,
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isExpanded
                ? isLoading
                ? 50.h
                : (DebtScheduleController.instance.regionsModel.value.data?.length ?? 0) > 5
                ? 300.h
                : (DebtScheduleController.instance.regionsModel.value.data?.length ?? 0) * 70.h
                : 0,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: dark ? TColors.dark : TColors.lightGrey,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Obx(() {
              if (isLoading) {
                return const Center(child: LoadingWidget());
              }
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: DebtScheduleController.instance.regionsModel.value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    print(DebtScheduleController.instance.regionsModel.value.data?[index].title);
                    print(DebtScheduleController.instance.regionsModel.value.data?[index].id);
                    return countryCodeItemBuilder(index);
                  },
                ),
              );
            }),
          ),
          isExpanded ? TSizes.spaceBtwItems.verticalSpace : const SizedBox(),
        ],
      ) : const SizedBox(),
    ));
  }

  InkWell countryCodeItemBuilder(int index) {
    final regionData = DebtScheduleController.instance.regionsModel.value.data?[index];
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          DebtScheduleController.instance.sponsorAddress.value = regionData?.title ?? "";
          DebtScheduleController.instance.selectedSponsorId.value = regionData?.id ?? 0;
          isExpanded = false;
        });
        print(DebtScheduleController.instance.selectedSponsorId.value = regionData?.id ?? 0);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            8.horizontalSpace,
            Text(regionData?.title ?? ""),
            16.horizontalSpace,
            const Spacer(),
            Radio<int>(
              value: regionData?.id ?? 0,
              groupValue: DebtScheduleController.instance.selectedSponsorId.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    DebtScheduleController.instance.selectedSponsorId.value = value;
                    DebtScheduleController.instance.sponsorAddress.value = regionData?.title ?? "";
                    isExpanded = false;
                    HomeController.instance.nameSearch(regionData?.id);
                  });
                  TLoggerHelper.info("Changed Selected ID: $value");
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
