import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taha_debts/utils/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(color: TColors.buttonSecondary, size: 80);
  }
}
