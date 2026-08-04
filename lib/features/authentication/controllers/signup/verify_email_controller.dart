// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:quick_ledger/common/widgets/login_signup/success_screen.dart';
// import 'package:quick_ledger/data/repositories/authentication_repository.dart';
// import 'package:quick_ledger/utils/constants/images.dart';
// import 'package:quick_ledger/utils/constants/text_strings.dart';
// import 'package:quick_ledger/utils/popups/snackbar_helpers.dart';

// class VerifyEmailController extends GetxController {
//   static VerifyEmailController get instance => Get.find();

//   void onInit() {
//     sendEmailVerification();
//     setTimerForAutoRedirect();
//     super.onInit();
//   }

//   // variable

//   // send email verification link to current user
//   Future<void> sendEmailVerification() async {
//     try {
//       await AuthenticationRepository.instance.sendEmailVerification();
//       GSnackBarHelpers.successSnackBar(
//         title: 'Email Sent',
//         message: 'Please check your inbox and verify your email',
//       );
//     } catch (e) {
//       GSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
//     }
//   }

//   void setTimerForAutoRedirect() {
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       FirebaseAuth.instance.currentUser!.reload();
//       final user = FirebaseAuth.instance.currentUser;
//       if (user?.emailVerified ?? false) {
//         timer.cancel();
//         Get.off(
//           () => SuccessScreen(
//             title: GTexts.accountCreatedTitle,
//             subTitle: GTexts.accountCreatedSubTitle,
//             image: GImages.journalsIcon,
//             onTap: () => AuthenticationRepository.instance.screenRedirect(),
//           ),
//         );
//       }
//     });
//   }

//   // manually check email verification status when user clicks continue button
//   Future<void> checkEmailVerificationStatus() async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser != null && currentUser.emailVerified) {
//         Get.off(
//           () => SuccessScreen(
//             title: GTexts.accountCreatedTitle,
//             subTitle: GTexts.accountCreatedSubTitle,
//             image: GImages.journalsIcon,
//             onTap: () => AuthenticationRepository.instance.screenRedirect(),
//           ),
//         );
//       } else {
//         GSnackBarHelpers.errorSnackBar(
//           title: 'Email Not Verified',
//           message: 'Please verify your email and try again.',
//         );
//       }
//     } catch (e) {
//       GSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
//     }
//   }
// }
