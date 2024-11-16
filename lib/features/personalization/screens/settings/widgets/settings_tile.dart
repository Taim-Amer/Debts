import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/sizes.dart';

class SettingsTile extends StatefulWidget {
  const SettingsTile({super.key, required this.title, required this.icon, this.showSwitch = false, this.function});

  final String title;
  final String icon;
  final bool? showSwitch;
  final VoidCallback? function;

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: TSizes.md.h),
                child: Row(
                  children: [
                    SvgPicture.asset(widget.icon),
                    8.horizontalSpace,
                    Text(widget.title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.grey)),

                  ],
                ),
              ),
              widget.showSwitch == true ? CupertinoSwitch(
                value: isSwitched,
                onChanged: (value){
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: TColors.greenColor,
              ) : const Icon(Icons.arrow_forward_ios_sharp, color: Colors.black,),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
