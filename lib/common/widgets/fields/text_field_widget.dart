import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.title, required this.hint, this.icon});

  final String title;
  final String hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (icon != null) ...[
                8.horizontalSpace,
                Icon(icon, color: TColors.buttonPrimary),
              ],
            ],
          ),
        ),
        12.verticalSpace,
        TextFormField(
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          cursorColor: TColors.buttonPrimary,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
