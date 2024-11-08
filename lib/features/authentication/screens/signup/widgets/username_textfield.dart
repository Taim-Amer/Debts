import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signup/signup_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class UsernameTextField extends StatelessWidget {
  UsernameTextField({super.key});

  final signupController = Get.find<SignupController>();
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
          controller: signupController.usernameController,
          validator: (value) => TValidator.validateEmptyText("اسم المستخدم", value),
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: TTexts.username,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            border: InputBorder.none,
          ),
          cursorColor: TColors.buttonPrimary,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
