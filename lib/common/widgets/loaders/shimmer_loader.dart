import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taha_debts/common/widgets/custom_shapes/containers/rounded_container.dart';

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
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: TRoundedContainer(
          width: width,
          height: height,
          backgroundColor: Colors.white,
      ),
    );
  }
}
