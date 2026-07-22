import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class GSignupForm extends StatelessWidget {
  const GSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = SignupController.Instance;
    return Form(
      // key: controller.signUpFormKey,
      child: Column(
        children: [
          TextFormField(
            // controller: controller.firstName,
            // validator: (value) =>
            //     UValidator.validateEmptyText('First Name', value),
            decoration: InputDecoration(
              labelText: GTexts.fullName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),

          //email
          TextFormField(
            // controller: controller.email,
            // validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: GTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),
          //phone Number
          TextFormField(
            // controller: controller.phoneNumber,
            // validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: GTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),
          Divider(),
          SizedBox(height: GSizes.spaceBtwInputFields),
          Text(
            "Business Details",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: GSizes.sm,),
          // business details
          TextFormField(
            // controller: controller.phoneNumber,
            // validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: GTexts.businessName,
              prefixIcon: Icon(Icons.business),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),
          TextFormField(
            // controller: controller.phoneNumber,
            // validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: GTexts.businessType,
              prefixIcon: Icon(Iconsax.activity),
            ),
          ),

          SizedBox(height: GSizes.spaceBtwInputFields),
          //password
          TextFormField(
            // obscureText: controller.isPasswordVisible.value,
            // controller: controller.password,
            // validator: (value) => UValidator.validatePassword(value),
            decoration: InputDecoration(
              labelText: GTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.eye_slash),
              ),
              // onPressed: () => controller.isPasswordVisible.value =
              //     !controller.isPasswordVisible.value,
              // icon: Icon(
              //   controller.isPasswordVisible.value
              //       ? Iconsax.eye
              //       : Iconsax.eye_slash,
            ),
          ),

          SizedBox(height: GSizes.spaceBtwInputFields / 2),
          // privacy policy checkbox
          // UPrivacyPolicyCheckBox(),
          SizedBox(height: GSizes.spaceBtwItems),

          //create user account
          GElevatedButton(
            onPressed: () {
              // controller.registerUser();
              // Get.to(() => VerifyEmailScreen());
            },
            child: Text(GTexts.createAccount),
          ),
        ],
      ),
    );
  }
}
