import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class ClientProfileNavBar extends StatelessWidget {
  const ClientProfileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: SizedBox(height: 50.h, child: OutlinedButton(onPressed: (){}, child: Text(TTexts.buying, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: TColors.redColor))))),
          15.horizontalSpace,
          Expanded(
            child: SizedBox(
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: TColors.greenColor,
                  backgroundColor: TColors.greenColor,
                  side: const BorderSide(color: TColors.greenColor, width: 2),
                ),
                child: Text(TTexts.payment, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
