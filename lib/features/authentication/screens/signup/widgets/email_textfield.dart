import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signup/signup_controller.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({super.key});

  final signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              const Icon(Icons.email, color: TColors.buttonPrimary,),
              8.horizontalSpace,
              Text(TAppTranslations.kEmail, style: Theme.of(context).textTheme.titleSmall,),
            ],
          ),
        ),
        12.verticalSpace,
        TextFormField(
          validator: (value) => TValidator.validateEmail(value),
          controller: signupController.emailController,
          decoration: InputDecoration(
            hintText: 'username1234@gmail.com',
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            border: InputBorder.none,
          ),
          cursorColor: TColors.buttonPrimary,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
