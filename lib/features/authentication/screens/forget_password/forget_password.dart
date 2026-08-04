import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/common/style/padding.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/features/authentication/screens/forget_password/reset_password.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: GPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// header
              /// title
              Text(
                GTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: GSizes.spaceBtwItems / 2),

              /// subtitle
              Text(
                GTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: GSizes.spaceBtwSections * 2),

              /// form
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: GTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  SizedBox(height: GSizes.spaceBtwItems),
                  GElevatedButton(
                    onPressed: () {
                      Get.to(() => ResetPassword());
                    },
                    child: Text(GTexts.submit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
