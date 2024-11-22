import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_appbar.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_item.dart';
import 'package:taha_debts/features/notifications/screens/widgets/notifications_shimmer.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/device/device_utility.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class NotationsScreen extends StatelessWidget {
  const NotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(title: NotationAppbar()),
      body: Obx(() => NotationsController.instance.getNotesStatus.value == RequestState.loading  ? const NotificationsShimmer() : SingleChildScrollView(
        child: RefreshIndicator(
          backgroundColor: dark ? TColors.dark : TColors.light,
          color: TColors.primary,
          onRefresh: () => NotationsController.instance.getNotes(),
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace.h),
            child: SizedBox(
              height: TDeviceUtils.getScreenHeight() - (TDeviceUtils.getAppBarHeight() + 50),
              child: ListView.separated(
                itemCount: NotationsController.instance.notesModel.value.data?.length ?? 0,
                itemBuilder: (context, index) => NotationItem(
                  date: NotationsController.instance.notesModel.value.data?[index].date ?? "",
                  description: NotationsController.instance.notesModel.value.data?[index].title ?? "",
                ),
                separatorBuilder: (context, _) => const Divider(color: Color(0xFFE3E3E3),),
              ),
            ),
          ),
        ),
      ))
    );
  }
}
