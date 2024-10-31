import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.title, required this.icon});

  final String title;
  final String icon;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios, color: Colors.black,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: TSizes.md.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.grey)),
                  8.horizontalSpace,
                  SvgPicture.asset(icon),
                ],
              ),
            ),
          ],
        ),
        const Divider(color: Color(0xFFD5D5D5),),
      ],
    );
  }
}
