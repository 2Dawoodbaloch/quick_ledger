import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:quick_ledger/bottom_navigation.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/home/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/profit_loss/profit_loss_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/reports_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<JournalController>(() => JournalController());
    Get.lazyPut<ReportsController>(() => ReportsController());
     Get.lazyPut<ProfitLossController>(() => ProfitLossController());
  }
}
