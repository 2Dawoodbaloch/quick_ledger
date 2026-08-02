
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/general_ledger/general_ledger_controller.dart';

class GeneralLedgerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneralLedgerController>(() => GeneralLedgerController());
  }
}