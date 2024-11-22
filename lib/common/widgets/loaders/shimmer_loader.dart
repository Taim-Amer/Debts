import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:taha_debts/utils/constants/colors.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';

class ShimmerLoader extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLoader({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? TColors.dark : Colors.grey[300]!,
      highlightColor: dark ? TColors.dark.withOpacity(.9) : Colors.grey[100]!,
      child: TRoundedContainer(
          width: width,
          height: height,
          backgroundColor: dark ? TColors.darkerGrey.withOpacity(.7) : Colors.white,
          // backgroundColor: Colors.white,
      ),
    );
  }
}
