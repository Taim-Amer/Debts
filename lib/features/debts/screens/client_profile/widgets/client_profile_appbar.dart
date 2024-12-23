import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_status_container.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class ClientProfileAppbar extends StatelessWidget{
  const ClientProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor: dark ? Colors.black : TColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClientStatusContainer(),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h),
            child: Text(TranslationKey.kClientInformation, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, color: TColors.grey)),
          ),
          10.horizontalSpace,
          BackIcon(function: () => Get.offAllNamed(AppRoutes.home)),
        ],
      ),
    );
  }
}
