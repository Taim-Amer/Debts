import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_appbar.dart';
import 'package:taha_debts/features/notations/screens/widgets/notation_item.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/device/device_utility.dart';

class NotationsScreen extends StatelessWidget {
  const NotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: NotationAppbar()),
      body: Obx(() => NotationsController.instance.getNotesStatus.value == RequestState.loading  ? const Center(child: LoadingWidget()) : SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: SizedBox(
            height: TDeviceUtils.getScreenHeight() - TDeviceUtils.getAppBarHeight(),
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
      ))
    );
  }
}
