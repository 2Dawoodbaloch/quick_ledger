
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/trial_balance/trial_balance_controller.dart';

class TrialBalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrialBalanceController>(() => TrialBalanceController());
  }
}