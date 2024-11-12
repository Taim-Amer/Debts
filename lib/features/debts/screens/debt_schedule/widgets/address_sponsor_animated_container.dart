import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class AddressSponsorAnimatedContainer extends StatefulWidget {
  const AddressSponsorAnimatedContainer({super.key, this.icon});

  final IconData? icon;

  @override
  State<AddressSponsorAnimatedContainer> createState() => _AddressSponsorAnimatedContainerState();
}

class _AddressSponsorAnimatedContainerState extends State<AddressSponsorAnimatedContainer> {
  bool isExpanded = false;
  bool isLoading = false;

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
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.location_on, color: TColors.buttonPrimary),
                  8.horizontalSpace,
                  Flexible(
                    child: Text(
                      TArabicTexts.sponsorAddress,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                      icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF353535), size: 28.h),
                    ),
                    Expanded(
                      child: Obx(() {
                        return TextFormField(
                          readOnly: true,
                          controller: TextEditingController(
                            text: DebtScheduleController.instance.sponsorAddress.value ?? "مساكن برزة",
                          ),
                          decoration: InputDecoration(
                            hintText: null,
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
                  return countryCodeItemBuilder(index);
                },
              ),
            );
          }),
        ),
      ],
    );
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
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            8.horizontalSpace,
            Text(regionData?.title ?? ""),
            16.horizontalSpace,
            const Spacer(),
            Radio<String>(
              value: regionData?.title ?? "",
              groupValue: DebtScheduleController.instance.sponsorAddress.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  DebtScheduleController.instance.sponsorAddress.value = value ?? "";
                  DebtScheduleController.instance.selectedSponsorId.value = regionData?.id ?? 0;
                  isExpanded = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
