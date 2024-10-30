import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/app.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/borrower_row.dart';
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
      floatingActionButton: FloatingActionButton(onPressed: (){}),
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
                  HomeFilterContainer(title: TTexts.notations, function: (){}, icon: Icons.note_add,),
                  HomeFilterContainer(title: TTexts.nonPayers, function: (){},),
                  HomeFilterContainer(title: TTexts.country, function: (){}, icon: Icons.search,),
                  HomeFilterContainer(title: TTexts.filter, function: (){}, icon: Icons.file_copy,),
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

