import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/features/personalization/controllers/user_controller.dart';
import 'package:quick_ledger/utils/constants/keys/keys.dart';
import 'package:quick_ledger/utils/helpers/network_manager.dart';
import 'package:quick_ledger/utils/popups/full_screen_loader.dart';
import 'package:quick_ledger/utils/popups/snackbar_helpers.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // variables
  final _userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();

  @override
  void onInit() {
    // check if user has previously logged in with remember me checked
    email.text = localStorage.read(GKeys.rememberMeEmail) ?? '';
    password.text = localStorage.read(GKeys.rememberMePassword) ?? '';
    super.onInit();
  }

  // check if user has previously logged in with remember me checked
  Future<void> loginWithEMailAndPassword() async {
    try {
      // start loading
      // GFullScreenLoader.openLoadingDialog('Logging you in...');

      // check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        GSnackBarHelpers.warningSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again',
        );
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write(GKeys.rememberMeEmail, email.text.trim());
        localStorage.write(GKeys.rememberMePassword, password.text.trim());
      }

      // login User with email and password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // stop loading
      GFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // stop loading
      GFullScreenLoader.stopLoading();

      // show error message
      GSnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }

  // /// Google Sign in
  Future<void> googleSignIn() async {
    try {
      // start loading
      GFullScreenLoader.openLoadingDialog('Logging you in...');

      // check Internet connectivity
      final isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        GSnackBarHelpers.warningSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again',
        );
        return;
      }
      //------------------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------------------------------

      // google authentication
      UserCredential userCredential = await AuthenticationRepository.instance
          .signInWithGoogle();

      // save user Record
      await _userController.saveUserRecord(userCredential);
      // stop loading
      GFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // stop loading
      GFullScreenLoader.stopLoading();
      // show error message
      GSnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}
