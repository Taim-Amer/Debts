import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/borrowers_list.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/debts_filter_dialog.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_filter_container.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/search_by_name_field.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/statistics_row.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeWithDataForm extends StatelessWidget {
  const HomeWithDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            const StatisticsRow(),
            TSizes.spaceBtwSections.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: HomeFilterContainer(title: TTexts.notations, function: (){}, icon: Icons.note_add,)),
                3.horizontalSpace,
                Expanded(child: HomeFilterContainer(title: TTexts.nonPayers, function: (){},)),
                3.horizontalSpace,
                Expanded(child: HomeFilterContainer(title: TTexts.country, function: (){}, icon: Icons.search,)),
                3.horizontalSpace,
                Expanded(
                  child: HomeFilterContainer(
                    title: TTexts.filter,
                    function: () => DebtsFilterDialog.showDebtsFilterDialog(),
                    icon: Icons.file_copy,
                  ),
                ),
              ],
            ),
            TSizes.spaceBtwInputField.verticalSpace,
            const SearchByNameTextField(),
            TSizes.spaceBtwItems.verticalSpace,
            const BorrowersList(),
            // TSizes.spaceBtwSections.verticalSpace,
          ],
        ),
      ),
    );
  }
}
