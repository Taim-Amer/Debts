import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class NotationItem extends StatelessWidget {
  const NotationItem({super.key, required this.date, required this.description});

  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.note, color: TColors.buttonPrimary, size: 21,),
                8.horizontalSpace,
                Text(TranslationKey.kNotations, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.buttonPrimary, fontSize: 18),),
              ],
            ),
            Text(date, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.buttonPrimary, fontSize: 14),),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
          child: Text(description.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
