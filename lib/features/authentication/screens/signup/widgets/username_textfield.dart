import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("اسم المستخدم", style: Theme.of(context).textTheme.titleSmall,),
              8.horizontalSpace,
              const Icon(Icons.person, color: TColors.buttonPrimary,)
            ],
          ),
        ),
        12.verticalSpace,
        TextFormField(
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: TTexts.username,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            border: InputBorder.none,
          ),
          cursorColor: TColors.buttonPrimary,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
