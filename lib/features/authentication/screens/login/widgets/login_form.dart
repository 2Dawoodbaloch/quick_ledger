import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

// ignore: must_be_immutable
class GLoginForm extends StatelessWidget {
  GLoginForm({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final controller = LoginController.instance;
    return Form(
      // key: controller.loginFormKey,
      child: Column(
        children: [
          /// email
          TextFormField(
            controller: email,
            // validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: GTexts.email,
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),

          /// password
          TextFormField(
            controller: password,
            // validator: (value) =>
            //     UValidator.validateEmptyText('Password', value),
            // obscureText: controller.isPasswordVisible.value,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.lock),

              suffixIcon: IconButton(
                icon: Icon(
                  // controller.isPasswordVisible.value
                  //     ? Iconsax.eye_slash
                  //     : Iconsax.eye,
                  Iconsax.eye_slash,
                ),
                onPressed: () {
                  // controller.isPasswordVisible.toggle();
                },
              ),
            ),
          ),

          SizedBox(height: GSizes.spaceBtwInputFields),

          /// forgotten password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text(GTexts.forgotPassword)),
            ],
          ),
          SizedBox(height: GSizes.spaceBtwSections),

          /// sign In
          GElevatedButton(
            // onPressed: controller.loginWithEMailAndPassword,
            onPressed: () {},
            child: Text(GTexts.logIn),
          ),
          SizedBox(height: GSizes.spaceBtwItems / 2),

          /// Create Account
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Get.to(SignUpScreen());
                // Get.to(SignUpScreen());
              },
              child: Text(GTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
