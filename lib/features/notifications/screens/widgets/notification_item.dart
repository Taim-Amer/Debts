import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.title, required this.body, required this.time});

  final String title;
  final String body;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.notifications, color: TColors.buttonPrimary, size: 21,),
                8.horizontalSpace,
                Text(title.toString(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TColors.buttonPrimary, fontSize: 18),),
              ],
            ),
            Text(time.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.grey, fontSize: 14),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
              child: Text(body.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ],
    );
  }
}
