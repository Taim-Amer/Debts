import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/features/personalization/screens/profile/widgets/profile_appbar.dart';
import 'package:taha_debts/features/personalization/screens/profile_edit/widgets/save_button.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: ProfileAppbar()),
      floatingActionButton: Obx((){
        Widget current = ProfileController.instance.editProfileApiStatus.value == RequestState.loading ? const LoadingWidget() : const SaveButton();
        return current;
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: ProfileController.instance.profileKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldWidget(
                  controller: ProfileController.instance.newNameController,
                  keyboardType: TextInputType.text,
                  title: TranslationKey.kUsername,
                  hint: TranslationKey.kUsername,
                  icon: Icons.person,
                  validator: (value) => TValidator.validateEmptyText(" ${TranslationKey.kUsername}", value),
                )
              ],
            ),
        ),
      ),
    );
  }
}
