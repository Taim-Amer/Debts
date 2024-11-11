import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class DebtAdditionAddNew extends StatelessWidget {
  const DebtAdditionAddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TRoundedContainer(
        width: 160.w,
        height: 32.h,
        backgroundColor: const Color(0xFFBFE3FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TArabicTexts.addNewItem, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.buttonPrimary),),
            const Icon(Icons.add, color: TColors.buttonPrimary)
          ],
        ),
      ),
    );
  }
}
