import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/debt_schedule_screen.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/borrower_row.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/debts_filter_dialog.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_filter_container.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/search_by_name_field.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/statistics_row.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      floatingActionButton: TCircularIcon(
        icon: Icons.add,
        backgroundColor: TColors.buttonPrimary,
        width: 64.w,
        height: 64.h,
        size: 34,
        color: Colors.white,
        onPressed: (){
          Get.to(const DebtScheduleScreen(), transition: Transition.rightToLeft);
        },
      ),
      body: SingleChildScrollView(
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
              TSizes.spaceBtwSections.verticalSpace,
              const BorrowerRow()
            ],
          ),
        ),
      ),
    );
  }
}

