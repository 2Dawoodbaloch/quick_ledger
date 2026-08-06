import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/features/authentication/controllers/login/login_controller.dart';
import 'package:quick_ledger/features/authentication/screens/forget_password/forget_password.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/validators/validation.dart';

class GLoginForm extends StatelessWidget {
  GLoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// email
          TextFormField(
            controller: controller.email,
            validator: (value) => GValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: GTexts.email,
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),

          /// password
          TextFormField(
            controller: controller.password,
            validator: (value) =>
                GValidator.validateEmptyText('Password', value),
            obscureText: controller.isPasswordVisible.value,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.lock),
              labelText: GTexts.password,
              suffixIcon: IconButton(
                icon: Obx(() => Icon(
                  controller.isPasswordVisible.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye,
                ),),
                onPressed: () {
                  controller.isPasswordVisible.toggle();
                },
              ),
            ),
          ),

          SizedBox(height: GSizes.spaceBtwInputFields),
 /// remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Row(
            children: [
                 Obx(
                () => Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (value) {
                    controller.rememberMe.toggle();
                  },
                ),
              ),
              Text(GTexts.rememberMe),
            ],
           ),

              /// forgotten password
              TextButton(
                onPressed: () {
                  Get.to(() => ForgetPassword());
                },
                child: Text(GTexts.forgotPassword),
              ),
            ],
          ),

    
          SizedBox(height: GSizes.spaceBtwSections),

          /// sign In
          GElevatedButton(
            onPressed: controller.loginWithEMailAndPassword,
            child: Text(GTexts.logIn),
          ),
          SizedBox(height: GSizes.spaceBtwItems / 2),
          /// Create Account
          SizedBox(
            width: double.infinity,
            child: GElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesName.signup);
              },
              child: Text("Create an account"),
            ),
          ),
        ],
      ),
    );
  }
}
