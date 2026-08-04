
import 'package:get/get.dart';
import 'package:quick_ledger/features/authentication/controllers/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}