import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/by_sponsor_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_appbar.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_header.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_loading_screen.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/client_profile_navbar.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/collection_date_container.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/navbar_shimmer.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/transactions_list.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(() => ClientProfileController.instance.getClientProfileStatus.value == RequestState.loading ? const NavbarShimmer() : const ClientProfileNavBar()),
      body: Obx(() {
        return ClientProfileController.instance.getClientProfileStatus.value == RequestState.loading
            ? const ClientProfileLoadingScreen()
            : SingleChildScrollView(
                child: RefreshIndicator(
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  color: TColors.primary,
                  onRefresh: () => ClientProfileController.instance.getClientProfile(TCacheHelper.getData(key: 'client_id')),
                  child: Padding(
                      padding: TSpacingStyle.paddingWithAppBarHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              const ClientProfileAppbar(),
                              const ClientProfileHeader(),
                              TSizes.md.verticalSpace,
                            ],
                          ),
                          Obx(() => ClientProfileController.instance.clientProfileModel.value.customer?.sponsor?.sponsorName != null ? const BySponsorContainer() : const SizedBox()),
                          Obx(() => ClientProfileController.instance.clientProfileModel.value.customer?.sponsor?.sponsorName != null ? TSizes.sm.verticalSpace : const SizedBox()),
                          const CollectionDateContainer(),
                          TSizes.spaceBtwInputField.verticalSpace,
                          const TransactionsList(),
                        ],
                      ),
                  ),
                ),
                    );
      }),
    );
  }
}
