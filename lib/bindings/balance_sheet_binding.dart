
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/balance_sheet/balance_sheet_controller.dart';

class BalanceSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalanceSheetController>(() => BalanceSheetController());
  }
}