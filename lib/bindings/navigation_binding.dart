import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:quick_ledger/features/ledger/controllers/home/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/new_account/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/new_journal_entry/controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());

    Get.lazyPut<NewAccountController>(() => NewAccountController());
     


    Get.lazyPut<JournalController>(() => JournalController());

    Get.lazyPut<NewJournalEntryController>(() => NewJournalEntryController());

    // Get.lazyPut<AccountController>(() => AccountController());
  }
}