import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/features/personalization/screens/profile/widgets/profile_appbar.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: ProfileAppbar()),
      body: Obx(() => ProfileController.instance.getProfileApiStatus.value == RequestState.loading ? const Center(child: LoadingWidget()) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TCircularContainer(
            backgroundColor: TColors.borderPrimary,
            width: 150.w,
            height: 150.h,
            child: SvgPicture.asset(TImages.userProfile),
          ),
          TSizes.spaceBtwItems.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () => Get.toNamed(AppRoutes.profileEdit), icon: const Icon(Icons.edit, color: TColors.buttonPrimary, size: 20,)),
                  Obx(() {
                    return Text(
                      ProfileController.instance.userProfileModel.value.data?.name ?? "",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18, color: TColors.buttonPrimary),
                    );
                  }),
                  30.horizontalSpace,
                ],
              ),
              Obx(() {
                return Text(
                  ProfileController.instance.userProfileModel.value.data?.email ?? "",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: TColors.softGrey),
                );
              })
            ],
          ),
        ],
      )),
    );
  }
}
