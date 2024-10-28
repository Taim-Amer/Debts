import 'package:flutter/material.dart';
import 'package:taha_debts/app.dart';
import 'package:taha_debts/utils/dependencies/service_locator.dart';

Future<void> main() async{

  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();

  runApp(const App());
}

