import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/search_by_country_animated_container.dart';

class SearchByCountryAnimatedTextfield extends StatelessWidget {
  const SearchByCountryAnimatedTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          child: HomeController.instance.isExpanded.value
              ? const SearchByCountryAnimatedContainer()
              : const SizedBox(),
        ));
  }
}
