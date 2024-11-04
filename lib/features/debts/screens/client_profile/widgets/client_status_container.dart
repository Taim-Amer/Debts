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
          onTap: toggleExpand,
          child: TRoundedContainer(
            height: 38.h,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: const Color(0xFFBFE3FF),
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_sharp,
                    color: TColors.buttonPrimary,
                    size: TSizes.iconSm,
                  ),
                  Text(
                    TTexts.clientStatus,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12, color: TColors.buttonPrimary),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
        TRoundedContainer(
          width: 92.w,
          backgroundColor: Colors.white,
          showShadow: isExpanded,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          child: AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isExpanded ? 100.h : 0,
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(10.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TRoundedContainer(backgroundColor: TColors.redColor, width: 18, height: 18),
                    9.verticalSpace,
                    const TRoundedContainer(backgroundColor: TColors.yellowColor, width: 18, height: 18),
                    9.verticalSpace,
                    const TRoundedContainer(backgroundColor: TColors.greenColor, width: 18, height: 18),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
