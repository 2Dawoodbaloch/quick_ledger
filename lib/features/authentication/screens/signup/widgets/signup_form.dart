import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/features/authentication/controllers/signup/signup_controller.dart';
import 'package:quick_ledger/features/authentication/screens/signup/widgets/privacy_policy_checkbox.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/validators/validation.dart';

class GSignupForm extends StatelessWidget {
   GSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.name,
            validator: (value) =>
                GValidator.validateEmptyText('Name', value),
            decoration: InputDecoration(
              labelText: GTexts.fullName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),

          //email
          TextFormField(
            controller: controller.email,
            validator: (value) => GValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: GTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),
          //phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => GValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: GTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),
          Divider(color: GColors.dark,),
          SizedBox(height: GSizes.spaceBtwInputFields),
          Text(
            "Business Details",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: GSizes.sm,),
          // business details
          TextFormField(
            controller: controller.businessName,
            decoration: InputDecoration(
              labelText: GTexts.businessName,
              prefixIcon: Icon(Icons.business),
            ),
          ),
          SizedBox(height: GSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.businessType,
            decoration: InputDecoration(
              labelText: GTexts.businessType,
              prefixIcon: Icon(Iconsax.activity),
            ),
          ),

          SizedBox(height: GSizes.spaceBtwInputFields),
          //password

          TextFormField(
            obscureText: controller.isPasswordVisible.value,
            controller: controller.password,
            validator: (value) => GValidator.validatePassword(value),
            decoration: InputDecoration(
              labelText: GTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
               onPressed: () => controller.isPasswordVisible.value =
                  !controller.isPasswordVisible.value,
              icon:Obx(() =>  Icon(
                controller.isPasswordVisible.value
                    ? Iconsax.eye
                    : Iconsax.eye_slash,
              ),)
           
            ),
          ),),

          SizedBox(height: GSizes.spaceBtwInputFields / 2),
          // privacy policy checkbox
          GPrivacyPolicyCheckBox(),
          SizedBox(height: GSizes.spaceBtwItems),

          //create user account
          // GElevatedButton(
          //   onPressed: () {
          //     controller.registerUser();
          //     // Get.to(() => VerifyEmailScreen());
          //   },
          //   child: Text(GTexts.createAccount),
          // ),

          ElevatedButton(onPressed: (){
             controller.registerUser();
          }, child: Text("Create Account"))
        ],
      ),
    );
  }
}
