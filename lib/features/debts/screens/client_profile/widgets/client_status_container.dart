import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class ClientStatusContainer extends StatefulWidget {
  const ClientStatusContainer({super.key});

  @override
  State<ClientStatusContainer> createState() => _ClientStatusContainerState();
}

class _ClientStatusContainerState extends State<ClientStatusContainer> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpand, // Call the toggleExpand method here
          child: TRoundedContainer(
            height: 32.h,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: const Color(0xFFBFE3FF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.keyboard_arrow_down_sharp, color: TColors.buttonPrimary, size: TSizes.iconSm),
                Text(
                  TTexts.clientStatus,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12, color: TColors.buttonPrimary),
                ),
              ],
            ),
          ),
        ),
        10.verticalSpace,
        TRoundedContainer(
          backgroundColor: Colors.transparent,
          showBorder: isExpanded,
          borderColor: TColors.grey,
          height: 100.h,
          width: 92.w,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isExpanded ? null : 0,
            color: Colors.transparent,
            padding: EdgeInsets.all(10.w),
            curve: Curves.easeInOut,
            child: isExpanded
                ? SingleChildScrollView(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TRoundedContainer(backgroundColor: TColors.redColor, width: 18, height: 18,),
                    9.verticalSpace,
                    const TRoundedContainer(backgroundColor: TColors.yellowColor, width: 18, height: 18,),
                    9.verticalSpace,
                    const TRoundedContainer(backgroundColor: TColors.greenColor, width: 18, height: 18,),
                  ],
                ),
            )
                : const SizedBox.shrink(), // Return a SizedBox when not expanded
          ),
        ),
      ],
    );
  }
}
