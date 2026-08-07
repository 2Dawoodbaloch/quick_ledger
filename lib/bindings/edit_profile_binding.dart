
import 'package:get/get.dart';
import 'package:quick_ledger/features/personalization/profiles/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}