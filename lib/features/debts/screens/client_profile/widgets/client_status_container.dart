import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

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
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpand,
          child: TRoundedContainer(
            height: 42.h,
            width: 102.w,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: const Color(0xFFBFE3FF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TranslationKey.kClientStatus,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12, color: TColors.buttonPrimary),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_sharp,
                  color: TColors.buttonPrimary,
                  size: TSizes.iconSm,
                ),
              ],
            ),
          ),
        ),
        10.verticalSpace,
        TRoundedContainer(
          width: 92.w,
          backgroundColor: dark ? TColors.darkGrey : Colors.white,
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
              height: isExpanded ? 120.h : 0,
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => ClientProfileController.instance.updateClientStatus('unallowed'),
                    child: const TRoundedContainer(
                      backgroundColor: TColors.redColor,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  // 9.verticalSpace,
                  GestureDetector(
                    onTap: () => ClientProfileController.instance.updateClientStatus('warn'),
                    child: const TRoundedContainer(
                      backgroundColor: TColors.yellowColor,
                      width: 22,
                      height: 22,
                    ),
                  ),
                  // 9.verticalSpace,
                  GestureDetector(
                    onTap: () => ClientProfileController.instance.updateClientStatus('allowed'),
                    child: const TRoundedContainer(
                      backgroundColor: TColors.greenColor,
                      width: 22,
                      height: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
