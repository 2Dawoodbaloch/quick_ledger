
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/new_account/controller.dart';

class NewAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAccountController>(() => NewAccountController());
  }
}