import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/by_sponsor_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_debts_row.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_appbar.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_header.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_navbar.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/collection_date_container.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClientProfileController.instance.getClientProfileStatus.value != RequestState.success ? const Center(child: LoadingWidget()) : Scaffold(
      bottomNavigationBar: const ClientProfileNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const ClientProfileAppbar(),
                  TSizes.spaceBtwSections.verticalSpace,
                  const Padding(
                    padding: EdgeInsets.only(top: TSizes.defaultSpace * 3),
                    child: ClientProfileHeader(),
                  ),
                ],
              ),
              TSizes.md.verticalSpace,
              const BySponsorContainer(),
              TSizes.md.verticalSpace,
              const CollectionDateContainer(),
              TSizes.spaceBtwSections.verticalSpace,
              Align(alignment: Alignment.topRight, child: Text(TTexts.transactions, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),)),
              const ClientDebtsRow(),
            ],
          ),
        ),
      ),
    );
  }
}

