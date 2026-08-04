
import 'package:get/get.dart';
import 'package:quick_ledger/features/authentication/controllers/login/login_controller.dart';
import 'package:quick_ledger/features/authentication/controllers/signup/signup_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
Get.lazyPut<LoginController>( () => LoginController() );
  }
}