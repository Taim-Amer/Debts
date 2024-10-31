import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/buttons/back_icon.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_status_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/device/device_utility.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class ClientProfileAppbar extends StatelessWidget implements PreferredSizeWidget{
  const ClientProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackIcon(),
        10.horizontalSpace,
        Text(TTexts.clientInformation, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20, color: TColors.grey)),
        const ClientStatusContainer()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
