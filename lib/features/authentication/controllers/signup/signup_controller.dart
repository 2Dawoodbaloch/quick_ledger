import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/data/repositories/user/user_repository.dart';
import 'package:quick_ledger/features/authentication/models/user_model.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/helpers/network_manager.dart';
import 'package:quick_ledger/utils/popups/full_screen_loader.dart';
import 'package:quick_ledger/utils/popups/snackbar_helpers.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Varibale
  // final _authRepository = Get.put(AuthenticationRepository());
  final _authRepository = Get.find<AuthenticationRepository>();
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final name = TextEditingController();
  final businessName = TextEditingController();
  final businessType = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  Future<void> registerUser() async {
    try {
        //     // start loading
      GFullScreenLoader.openLoadingDialog(
        'We are Processing your information...',
      );

      log("========================================", name: "SIGNUP");
      log("REGISTER USER FLOW START", name: "SIGNUP");

      log("Checking Internet...", name: "SIGNUP");

      bool isConnected = await Get.put(NetworkManager()).isConnected();

      log("Internet : $isConnected", name: "SIGNUP");

      if (!isConnected) {
        log("No Internet", name: "SIGNUP");
        GFullScreenLoader.stopLoading();
        GSnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // privacy policy
      if (!privacyPolicy.value) {
        GFullScreenLoader.stopLoading();
        GSnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account you must accept privacy policy',
        );
        return;
      }

      log("Validating Form...", name: "SIGNUP");

      if (!signUpFormKey.currentState!.validate()) {
        log("Form Validation Failed", name: "SIGNUP");
        // GFullScreenLoader.stopLoading();
        return;
      }

      log("Form Validation Passed", name: "SIGNUP");

      log("Creating Firebase User...", name: "SIGNUP");

      final userCredential = await _authRepository.registerUser(
        email.text.trim(),
        password.text.trim(),
      );

      log("Firebase User Created", name: "SIGNUP");
      log("UID : ${userCredential.user?.uid}", name: "SIGNUP");

      final userModel = UserModel(
        id: userCredential.user!.uid,
        name: name.text,
        email: email.text.trim(),
        phone: phoneNumber.text.trim(),
        businessName: businessName.text,
        businessType: businessType.text,
      );

      log("UserModel Created", name: "SIGNUP");
      log(userModel.toString(), name: "SIGNUP");

      final userRepository = Get.put(UserRepository());

      log("Saving User to Firestore...", name: "SIGNUP");

      await userRepository.saveUserRecord(userModel);

      log("Firestore Save Success", name: "SIGNUP");

      GSnackBarHelpers.successSnackBar(
        title: 'Congratulation!',
        message: 'Your account has been created!',
      );

      GFullScreenLoader.stopLoading();

      log("Signup Flow Completed Successfully", name: "SIGNUP");
      Get.offAllNamed(RoutesName.login);
    } catch (e, stackTrace) {
      log("Signup Failed", name: "SIGNUP", error: e, stackTrace: stackTrace);

      GFullScreenLoader.stopLoading();

      GSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // function to register the user with email and password
  // Future<void> registerUser() async {
  //   try {
  //     // start loading
  //     GFullScreenLoader.openLoadingDialog(
  //       'We are Processing your information...',
  //     );

  //     // check Internet Connectivity
  //     bool isConnected = await Get.put(NetworkManager()).isConnected();
  //     if (!isConnected) {
  //       GFullScreenLoader.stopLoading();
  //       GSnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
  //       return;
  //     }

  //     // Check Privacy Policy
  //     if (!privacyPolicy.value) {
  //       GFullScreenLoader.stopLoading();
  //       GSnackBarHelpers.warningSnackBar(
  //         title: 'Accept Privacy Policy',
  //         message: 'In order to create account you must accept privacy policy',
  //       );
  //       return;
  //     }

  //     // form validation
  //     if (!signUpFormKey.currentState!.validate()) {
  //       GFullScreenLoader.stopLoading(); // ✅ close dialog
  //       return;
  //     }

  //     // Resgister user using firebase
  //     UserCredential userCredential = await _authRepository.registerUser(
  //       email.text.trim(),
  //       password.text.trim(),
  //     );

  //     // create user model
  //     UserModel userModel = UserModel(
  //       id: userCredential.user!.uid,
  //       name: name.text,
  //      email: email.text.trim(),
  //       phone: phoneNumber.text.trim(),
  //      businessName: businessName.text,
  //      businessType: businessType.text,
  //     );

  //     // save user record
  //     final userRepository = Get.put(UserRepository());
  //     await userRepository.saveUserRecord(userModel);

  //     // success message
  //     GSnackBarHelpers.successSnackBar(
  //       title: 'Congratulation!',
  //       message: 'Your account has been created!',
  //     );
  //     // stop loading
  //     GFullScreenLoader.stopLoading();

  //   } catch (e) {
  //     GFullScreenLoader.stopLoading();
  //     GSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
  //   }
  // }
}
