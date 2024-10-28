import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/image_strings.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeEmptyHeader extends StatelessWidget {
  const HomeEmptyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(TImages.money),
        Text(TTexts.emptyDebts, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: TColors.buttonPrimary)),
      ],
    );
  }
}
