import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class NotationItem extends StatelessWidget {
  const NotationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("2024/7/30", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary, fontSize: 14),),
            Row(
              children: [
                Text(TArabicTexts.notations, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.buttonPrimary, fontSize: 18),),
                8.horizontalSpace,
                const Icon(Icons.note, color: TColors.buttonPrimary, size: 21,),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
          child: Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.grey, fontSize: 14, fontWeight: FontWeight.w400), textDirection: TextDirection.rtl,),
        ),
        const Divider(color: Color(0xFFE3E3E3),)
      ],
    );
  }
}
