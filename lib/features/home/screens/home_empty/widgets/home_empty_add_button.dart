import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';

class HomeEmptyAddDebtsButton extends StatelessWidget {
  const HomeEmptyAddDebtsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 315.w, height: 50.h, child: ElevatedButton(onPressed: (){}, child: const Text(TTexts.addDebts)));
  }
}
