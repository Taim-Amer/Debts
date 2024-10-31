import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class PayAdditionAddNew extends StatelessWidget {
  const PayAdditionAddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TRoundedContainer(
        width: 144.w,
        height: 32.h,
        backgroundColor: const Color(0xFFBFE3FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TTexts.addNewItem, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
            const Icon(Icons.add, color: TColors.buttonPrimary)
          ],
        ),
      ),
    );
  }
}