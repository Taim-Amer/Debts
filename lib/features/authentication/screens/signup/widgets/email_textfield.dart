import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(TTexts.email, style: Theme.of(context).textTheme.titleSmall,),
              8.horizontalSpace,
              const Icon(Icons.email, color: TColors.buttonPrimary,)
            ],
          ),
        ),
        12.verticalSpace,
        TextFormField(
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: 'username1234@gmail.com',
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
