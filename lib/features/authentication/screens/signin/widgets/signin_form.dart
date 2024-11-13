import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/features/authentication/screens/signin/widgets/phone_country_code.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/device/device_utility.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignInController.instance.signinFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(TAppTranslations.kPhone, style: Theme.of(context).textTheme.titleSmall),
                  4.horizontalSpace,
                  SvgPicture.asset(TImages.mobile),
                ],
              ),
              TSizes.spaceBtwItems.verticalSpace,
              const PhoneCountryCode(),
              TSizes.spaceBtwItems.verticalSpace,
              Obx(() {
                Widget current = SignInController.instance.signinApiStatus.value == RequestState.loading ? const LoadingWidget() : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      TDeviceUtils.hideKeyboard(context);
                      SignInController.instance.signin();
                    },
                    child: Text(
                      TAppTranslations.kNext,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                );
                return current;
              }),
            ],
          ),
        ),
      ),
    );
  }
}
