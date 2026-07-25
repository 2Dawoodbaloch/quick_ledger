import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/utils/helpers/network_manager.dart';
import 'package:quick_ledger/utils/popups/full_screen_loader.dart';
import 'package:quick_ledger/utils/popups/snackbar_helpers.dart';

class SignupController extends GetxController {
  // ignore: non_constant_identifier_names
  static SignupController get Instance => Get.find();

  // Varibale
  // final _authRepository = Get.put(AuthenticationRepository());
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  // RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final businessName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  //function to register the user with email and password
  Future<void> registerUser() async {
    try {
      // start loading
      GFullScreenLoader.openLoadingDialog(
        'We are Processing your information...',
      );

      // check Internet Connectivity
      bool isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        GSnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // Check Privacy Policy
      // if (!privacyPolicy.value) {
      //   UFullScreenLoader.stopLoading();
      //   USnackBarHelpers.warningSnackBar(
      //     title: 'Accept Privacy Policy',
      //     message: 'In order to create account you must accept privacy policy',
      //   );
      //   return;
      // }

      // form validation
      if (!signUpFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading(); // ✅ close dialog
        return;
      }
      

      // Resgister user using firebase
      // UserCredential userCredential = await _authRepository.registerUser(
      //   email.text.trim(),
      //   password.text.trim(),
      // );

      // create user model
      // UserModel userModel = UserModel(
      //   id: userCredential.user!.uid,
      //   firstName: firstName.text,
      //   lastName: lastName.text,
      //   username: '${firstName.text}${lastName.text}716283',
      //   email: email.text.trim(),
      //   phoneNumber: phoneNumber.text.trim(),
      //   profilePicture: '',
      // );

      // save user record
      // final userRepository = Get.put(UserRepository());
      // await userRepository.saveUserRecord(userModel);

      // success message
      GSnackBarHelpers.successSnackBar(
        title: 'Congratulation!',
        message: 'Your account has been created! Verfiy email to continue',
      );
      // stop loading
      GFullScreenLoader.stopLoading();

      // redirect to verify email screen
      // Get.to(() => VerifyEmailScreen(email: email.text));
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
