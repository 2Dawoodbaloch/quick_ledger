import 'package:flutter/material.dart';
import 'package:quick_ledger/common/style/padding.dart';
import 'package:quick_ledger/common/widgets/buttons/social_buttons.dart';
import 'package:quick_ledger/common/widgets/login_signup/form_divider.dart';
import 'package:quick_ledger/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:quick_ledger/utils/constants/images.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: GPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: GSizes.containerHeight,
                width: GSizes.containerWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(GImages.ledgerIcon)),
                ),
              ),
              ///header
              Text(
                GTexts.createYourAccount,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: GSizes.xs),

               Text(
                GTexts.signUpSubtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: GSizes.spaceBtwSections),


              ///form
              GSignupForm(),
              SizedBox(height: GSizes.spaceBtwSections),

              ///divider
              GFormDivider(title: GTexts.logIn),
              SizedBox(height: GSizes.spaceBtwSections),

              ///footer
              GSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
