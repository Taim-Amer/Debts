import 'package:flutter/material.dart';
import 'package:taha_debts/app.dart';

import 'utils/storage/cache_helper.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await TCacheHelper.init();
  runApp(const App());
}
