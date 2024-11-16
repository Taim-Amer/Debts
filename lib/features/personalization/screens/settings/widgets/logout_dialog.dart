import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/personalization/controllers/settings/settings_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

Future<dynamic> showLogoutDialog(BuildContext context) async {
  final dark = THelperFunctions.isDarkMode(context);
  return await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: dark ? TColors.dark : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 395.w,
          height: 340.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              26.verticalSpace,
              SvgPicture.asset(TImages.logout),
              13.verticalSpace,
              Text(
                TranslationKey.kLogout,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 20,
                  color: TColors.buttonPrimary,
                ),
              ),
              13.verticalSpace,
              Text(
                TranslationKey.kLogoutQuastion,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: TColors.grey,
                ),
              ),
              22.verticalSpace,
              Obx(() => SettingsController.instance.logoutApiStatus.value == RequestState.loading ? const LoadingWidget() : SizedBox(
                width: 250.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    SettingsController.instance.logout();
                  },
                  child: Text(TranslationKey.kLogout),
                ),
              )),
              18.verticalSpace,
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  TranslationKey.kClose,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: TColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
