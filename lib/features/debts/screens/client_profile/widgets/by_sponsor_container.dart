import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class BySponsorContainer extends StatefulWidget {
  const BySponsorContainer({super.key});

  @override
  State<BySponsorContainer> createState() => _BySponsorContainerState();
}

class _BySponsorContainerState extends State<BySponsorContainer> {
  bool isExpanded = false;

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          borderColor: TColors.grey,
          showBorder: true,
          radius: 20.r,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _toggleExpand,
                  child: Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: TColors.grey,
                    size: TSizes.iconMd,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.xs),
                  child: Text(
                    TTexts.bySponsor,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14),
                  ),
                ),
                const Icon(Icons.group, color: TColors.buttonPrimary, size: TSizes.iconMd),
              ],
            ),
          ),
        ),
        10.verticalSpace,
        TRoundedContainer(
          showBorder: isExpanded == true ? true : false,
          borderColor: TColors.grey,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isExpanded ? null : 0, // Make height flexible
            padding: EdgeInsets.all(10.w),
            curve: Curves.easeInOut,
            child: isExpanded ? SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                  children: [
                    Text("أسم الكفيل: محمد أنس", style: Theme.of(context).textTheme.bodyLarge),
                    14.verticalSpace,
                    Text("عنوان الكفيل : مساكن برزة", style: Theme.of(context).textTheme.bodyLarge),
                    14.verticalSpace,
                    Text("رقم الهاتف: 345-321-0939", style: Theme.of(context).textTheme.bodyLarge),
                    // Add more text items if needed
                  ],
                ),
            ),
            )
                : null, // If not expanded, don't show anything
          ),
        ),
      ],
    );
  }
}