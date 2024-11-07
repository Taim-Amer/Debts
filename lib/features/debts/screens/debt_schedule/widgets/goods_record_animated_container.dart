import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class GoodsRecordAnimatedContainer extends StatefulWidget {
  const GoodsRecordAnimatedContainer({super.key, required this.hint, this.title, this.icon});

  final String hint;
  final String? title;
  final IconData? icon;

  @override
  State<GoodsRecordAnimatedContainer> createState() => _GoodsRecordAnimatedContainerState();
}

class _GoodsRecordAnimatedContainerState extends State<GoodsRecordAnimatedContainer> {
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
                            text: DebtScheduleController.instance.goodsRecord.value ?? widget.hint,
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
          height: isExpanded ? isLoading ? 50.h : (DebtScheduleController.instance.regionsList.length > 5 ? 300.h
              : DebtScheduleController.instance.regionsList.length * 70.h) : 0,
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
                itemCount: DebtScheduleController.instance.regionsList.length,
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
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          DebtScheduleController.instance.goodsRecord.value =
          DebtScheduleController.instance.regionsList[index].title!;
          isExpanded = false;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            Radio<String>(
              value: DebtScheduleController.instance.regionsList[index].title!,
              groupValue: DebtScheduleController.instance.goodsRecord.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  DebtScheduleController.instance.goodsRecord.value = value!;
                  isExpanded = false;
                });
              },
            ),
            const Spacer(),
            16.horizontalSpace,
            Text(DebtScheduleController.instance.regionsList[index].title!),
            8.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
