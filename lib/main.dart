import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_ledger/bindings/network_binding.dart';
import 'package:quick_ledger/data/repositories/accounts/account_repository.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/data/repositories/journal/journal_repository.dart';
import 'package:quick_ledger/firebase_options.dart';
import 'package:quick_ledger/routes/app_routes.dart';
import 'package:quick_ledger/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository(), permanent: true);
    Get.put(AccountRepository(), permanent: true);
    Get.put(JournalRepository(),permanent: true);
  });

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
      initialBinding: NetworkBinding(),
      getPages: AppRouter.pages,
      home: Scaffold(
        body: Center(child: CircularProgressIndicator(color: Colors.blue)),
      ),
    );
  }
}
