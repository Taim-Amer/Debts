import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class ClientProfileAppbar extends StatelessWidget {
  const ClientProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackIcon(),
        10.horizontalSpace,
        Text(TTexts.clientInformation, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, color: TColors.grey)),
        GestureDetector(
          onTap: (){},
          child: TRoundedContainer(
            height: 32.h,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: const Color(0xFFBFE3FF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.keyboard_arrow_down_sharp, color: TColors.buttonPrimary, size: TSizes.iconSm),
                Text(TTexts.clientStatus, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12, color: TColors.buttonPrimary)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
