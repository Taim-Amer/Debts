import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/borrowers_list.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/debts_filter_dialog.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_filter_container.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/search_by_country_animated_container.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/search_by_name_field.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/statistics_row.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class HomeWithDataForm extends StatelessWidget {
  const HomeWithDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
      backgroundColor: dark ? TColors.dark : TColors.light,
      color: TColors.primary,
      onRefresh: () => HomeController.instance.getMyDebts(null),
      child: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const StatisticsRow(),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: HomeFilterContainer(
                      title: TranslationKey.kFilter,
                      function: () => DebtsFilterDialog.showDebtsFilterDialog(),
                      icon: Icons.file_copy,
                    ),
                  ),
                  3.horizontalSpace,
                  Expanded(child: HomeFilterContainer(title: TranslationKey.kCountry, function: () => HomeController.instance.setExpanded(), icon: Icons.search,)),
                  3.horizontalSpace,

                  Expanded(child: HomeFilterContainer(title: TranslationKey.kNonPayers, function: (){},)),
                  3.horizontalSpace,

                  Expanded(child: HomeFilterContainer(title: TranslationKey.kNotations, function: (){
                    Get.toNamed(AppRoutes.notations);
                  }, icon: Icons.note_add, showCounter: true, count: NotationsController.instance.notesModel.value.data?.length)),
                ],
              ),
              TSizes.spaceBtwInputField.verticalSpace,
              // const SearchByCountryAnimatedTextfield(),
              const SearchByCountryAnimatedContainer(),
              const SearchByNameTextField(),
              TSizes.spaceBtwItems.verticalSpace,
              const BorrowersList(),
              // TSizes.spaceBtwSections.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
