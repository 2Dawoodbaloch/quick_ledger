import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/bindings/navigation_binding.dart';
import 'package:quick_ledger/routes/app_routes.dart';
import 'package:quick_ledger/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: GAppTheme.lightTheme,
      darkTheme: GAppTheme.darkTheme,
      initialBinding: NavigationBinding(),
      getPages: AppRouter.pages,

    );
  }
}
