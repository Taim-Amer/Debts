import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class GoodsRecordAnimatedContainer extends StatefulWidget {
  const GoodsRecordAnimatedContainer({super.key});

  @override
  State<GoodsRecordAnimatedContainer> createState() => _GoodsRecordAnimatedContainerState();
}

class _GoodsRecordAnimatedContainerState extends State<GoodsRecordAnimatedContainer> {
  final controller = DebtScheduleController.instance;
  bool isExpanded = false;
  bool isLoading = false;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: controller.goodsRecord.value ?? "سجل الاثاث");
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

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
                  Flexible(
                    child: Text(
                      TranslationKey.kRecords,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(() {
                      textController.text = controller.goodsRecord.value;
                      return TextFormField(
                        readOnly: true,
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: null,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                          border: InputBorder.none,
                        ),
                        // textAlign: TextAlign.end,
                        cursorColor: TColors.buttonPrimary,
                        keyboardType: TextInputType.phone,
                      );
                    }),
                  ),

                  IconButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                        isExpanded = !isExpanded;
                      });
                      await controller.getRecords();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFF353535), size: 28.h),
                  ),

                  8.horizontalSpace,
                ],
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
              : (controller.recordsModel.value.data?.length ?? 0) > 5
              ? 300.h
              : (controller.recordsModel.value.data?.length ?? 0) * 70.h
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
                itemCount: controller.recordsModel.value.data?.length ?? 0,
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
    final item = controller.recordsModel.value.data?[index];
    return InkWell(
      onTap: () {
        setState(() {
          controller.goodsRecord.value = item?.title ?? "";
          controller.selectedGoodsId.value = item?.id ?? 0;
          isExpanded = false;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            8.horizontalSpace,
            Text(item?.title ?? ""),
            16.horizontalSpace,
            const Spacer(),
            Radio<String>(
              value: item?.title ?? "",
              groupValue: controller.goodsRecord.value,
              activeColor: TColors.buttonPrimary,
              onChanged: (value) {
                setState(() {
                  controller.goodsRecord.value = value ?? "";
                  controller.selectedGoodsId.value = item?.id ?? 0;
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

