import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/fields/text_field_widget.dart';
import 'package:taha_debts/features/personalization/screens/profile/widgets/profile_appbar.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: ProfileAppbar()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(height: 50.h, child: ElevatedButton(onPressed: (){}, child: const Text("حفظ"))),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFieldWidget(title: "أسم المستخدم", hint: "أسم المستخدم و الكنية", icon: Icons.person, )
          ],
        ),
      ),
    );
  }
}
