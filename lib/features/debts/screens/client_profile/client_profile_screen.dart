import 'package:flutter/material.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_appbar.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: const Column(
            children: [
              ClientProfileAppbar(),
            ],
          ),
        ),
      ),
    );
  }
}
