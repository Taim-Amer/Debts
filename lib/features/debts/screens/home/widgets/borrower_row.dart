import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/router/app_router.dart';

class BorrowerRow extends StatelessWidget {
  const BorrowerRow({super.key, required this.amount, required this.name, required this.status, required this.lastUpdate, required this.id});

  final String amount;
  final String name;
  final String status;
  final String lastUpdate;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ClientProfileController.instance.getClientProfile(id);
        ClientProfileController.instance.getClientProfileStatus.listen((state){
          Get.toNamed(AppRoutes.clientProfile);
          if(state == RequestState.onError){
            Get.back();
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TCircularContainer(
                width: 34,
                height: 34,
                backgroundColor: TColors.lightGrey,
                child: Text(name[0], style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),),
              ),
              19.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14)),
                      10.horizontalSpace,
                      TRoundedContainer(width: 16.w, height: 16.h, radius: 10.r, backgroundColor: status == "allowed" ? TColors.greenColor : TColors.redColor),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: TColors.softGrey, size: 12,),
                      3.horizontalSpace,
                      Text(lastUpdate, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),

                    ],
                  )
                ],
              ),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(amount, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: status == "allowed" ? TColors.greenColor : TColors.redColor)),
              Text(TArabicTexts.debt, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TColors.softGrey, fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      ),
    );
  }
}