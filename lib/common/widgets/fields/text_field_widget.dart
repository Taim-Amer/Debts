import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.title,
    required this.hint,
    this.icon,
    this.hintColor = TColors.grey,
    this.titleColor = const Color(0xFF6D6E72),
    this.hintSize,
    this.radius,
    this.validator,
    this.controller,
  });

  final String title;
  final String hint;
  final IconData? icon;
  final Color? hintColor;
  final Color? titleColor;
  final double? hintSize;
  final double? radius;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

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
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: titleColor),
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
        radius != null ? Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: hintColor, fontSize: hintSize),
              filled: true,
              fillColor: TColors.lightGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          child: TextFormField(
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            ),
            cursorColor: TColors.buttonPrimary,
            keyboardType: TextInputType.phone,
          ),
        ) : TextFormField(
          controller: controller,
          validator: validator!,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: hintColor),
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
