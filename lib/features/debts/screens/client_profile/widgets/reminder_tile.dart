import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    super.key,
    required this.icon,
    required this.title,
    this.showRadio = false,
    this.value,
    this.groupValue,
    this.onChanged,
    this.showArrowIcon = false,
  });

  final String icon;
  final String title;
  final bool showRadio;
  final int? value;
  final int? groupValue;
  final ValueChanged<int?>? onChanged;
  final bool showArrowIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          showRadio ? Radio(value: value!, groupValue: groupValue!, onChanged: onChanged!) : const SizedBox(),
          showArrowIcon ? IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 16,)) : const SizedBox(),
          const Spacer(),
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18),
              ),
              8.horizontalSpace,
              SvgPicture.asset(icon),
            ],
          ),
        ],
      ),
    );
  }
}
