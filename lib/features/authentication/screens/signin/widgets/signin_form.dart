import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/features/authentication/screens/signin/widgets/phone_country_code.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/device/device_utility.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(SignInController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(TTexts.phone, style: Theme.of(context).textTheme.titleSmall),
                4.horizontalSpace,
                SvgPicture.asset(TImages.mobile),
              ],
            ),
            TSizes.spaceBtwItems.verticalSpace,
            PhoneCountryCode(signInController: signInController),
            TSizes.spaceBtwItems.verticalSpace,
            Obx(() {
              if (signInController.apiStatus.value == RequestState.loading) {
                return const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(color: TColors.buttonPrimary,),
                  ),
                );
              } else {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      TDeviceUtils.hideKeyboard(context);
                      signInController.signin();
                    },
                    child: Text(
                      TTexts.next,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
