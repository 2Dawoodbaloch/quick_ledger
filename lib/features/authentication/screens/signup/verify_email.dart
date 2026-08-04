// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_ledger/common/style/padding.dart';
// import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
// import 'package:quick_ledger/data/repositories/authentication_repository.dart';
// import 'package:quick_ledger/features/authentication/controllers/signup/verify_email_controller.dart';
// import 'package:quick_ledger/utils/constants/images.dart';
// import 'package:quick_ledger/utils/constants/sizes.dart';
// import 'package:quick_ledger/utils/constants/text_strings.dart';
// import 'package:quick_ledger/utils/helpers/device_helpers.dart';


// class VerifyEmailScreen extends StatelessWidget {
//   const VerifyEmailScreen({super.key, this.email});
//   final String? email;
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(VerifyEmailController());
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: AuthenticationRepository.instance.logout,
//             icon: Icon(CupertinoIcons.clear),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: GPadding.screenPadding,
//           child: Column(
//             children: [
              
//               Image.asset(
//                 GImages.homeIcon,
//                 height: GDeviceHelper.getScreenHeight(context) * 0.6,
//               ),
//               SizedBox(height: GSizes.spaceBtwItems),

//               ///title
//               Text(
//                 GTexts.verifyEmailTitle,
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//               SizedBox(height: GSizes.spaceBtwItems),

//               ///email
//               Text(email ?? '', style: Theme.of(context).textTheme.bodyMedium),
//               SizedBox(height: GSizes.spaceBtwItems),

//               ///subtitle
//               Text(
//                 GTexts.verifyEmailSubTitle,
//                 style: Theme.of(context).textTheme.bodySmall,
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: GSizes.spaceBtwItems),

//               ///continue
//               GElevatedButton(
//                 onPressed: () {
//                   controller.checkEmailVerificationStatus();
//                 },
//                 child: Text(GTexts.uContinue),
//               ),
//               SizedBox(height: GSizes.spaceBtwItems),

//               ///resend email
//               SizedBox(
//                 width: double.infinity,
//                 child: TextButton(
//                   onPressed: () {
//                     controller.sendEmailVerification;
//                   },
//                   child: Text(GTexts.resendEmail),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
