import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/appbar/appbar.dart';
import 'package:taha_debts/common/widgets/loaders/loading_widget.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_appbar.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_empty_form.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_floating_action_button.dart';
import 'package:taha_debts/features/debts/screens/home/widgets/home_with_data_form.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: HomeAppbar()),
      floatingActionButton: const HomeFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Obx((){
        var isLoading = HomeController.instance.getDebtsApiStatus.value == RequestState.loading;
        var isSearching = HomeController.instance.searchNameApiStatus.value == RequestState.loading;
        return (isLoading || isSearching)
            ? const Center(child: LoadingWidget()) : (HomeController.instance.getDebtsApiStatus.value == RequestState.success || HomeController.instance.searchNameApiStatus.value == RequestState.success)
                ? const HomeWithDataForm() : const HomeEmptyForm();
                // : HomeController.instance.searchNameApiStatus.value == RequestState.noData ? const HomeEmptyForm() : const Center(child: Text("No Data"));
      }),
    );
  }
}

