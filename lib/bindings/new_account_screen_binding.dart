import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:quick_ledger/features/ledger/controllers/new_account/controller.dart';

class NewAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAccountController>(
      () => NewAccountController(),
    );
  }
}