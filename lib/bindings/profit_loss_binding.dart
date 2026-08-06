
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/profit_loss/profit_loss_controller.dart';

class ProfitLossBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfitLossController>(() => ProfitLossController());
  }
}