import 'package:flutter/material.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/features/personalization/screens/profile/widgets/profile_appbar.dart';
import 'package:taha_debts/features/personalization/screens/profile_edit/widgets/save_button.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/validators/validation.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: ProfileAppbar()),
      floatingActionButton: const SaveButton(),
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
                  title: "اسم المستخدم الجديد",
                  hint: "اسم المستخدم و الكنية",
                  icon: Icons.person,
                  validator: (value) => TValidator.validateEmptyText("اسم المستخدم الجديد", value),
                )
              ],
            ),
        ),
      ),
    );
  }
}
