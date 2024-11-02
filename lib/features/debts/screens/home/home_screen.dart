import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/styles/spacing_styles.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/icons/circular_icon.dart';
import 'package:taha_debts/common/widgets/pickers/infinite_date_picker.dart';
import 'package:taha_debts/features/debts/screens/client_profile/widgets/reminder_tile.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/borrower_row.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_filter_container.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/search_by_name_field.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/statistics_row.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<dynamic> showDebtsFilterDialog() {
    return showModalBottomSheet(
      context: Get.context!,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: 700.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: TSizes.lg.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 700.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.close, color: const Color(0xFF6D6E72), size: 24.sp),
                      ),
                      SizedBox(width: 24.w),
                    ],
                  ),
                  TSizes.spaceBtwSections.verticalSpace,
                  const ChoiceChip(label: Text("data"), selected: true, disabledColor: Colors.white,),
                  TSizes.spaceBtwSections.verticalSpace,
                  const InfiniteDatePicker(),
                  TSizes.spaceBtwSections.verticalSpace,
                  const ReminderTile(icon: "", title: "من الأعلى إلى الأدنى"),
                  const ReminderTile(icon: "", title: "من الأدنى إلى الأعلى"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      floatingActionButton: TCircularIcon(icon: Icons.add, backgroundColor: TColors.buttonPrimary, width: 64.w, height: 64.h, size: 34, color: Colors.white,),
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
                  HomeFilterContainer(
                    title: TTexts.filter,
                    function: () => showDebtsFilterDialog(),
                    icon: Icons.file_copy,
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

