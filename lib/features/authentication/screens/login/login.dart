import 'package:flutter/material.dart';
import 'package:quick_ledger/common/widgets/buttons/social_buttons.dart';
import 'package:quick_ledger/common/widgets/login_signup/form_divider.dart';
import 'package:quick_ledger/features/authentication/screens/login/widgets/login_form.dart';
import 'package:quick_ledger/features/authentication/screens/login/widgets/login_header.dart';
import 'package:quick_ledger/utils/constants/images.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: GSizes.containerHeight,
                  width: GSizes.containerWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(GImages.ledgerIcon)),
                  ),
                ),
            
                GLoginHeader(),
            
                SizedBox(height: GSizes.spaceBtwSections),
            
                // Form
                GLoginForm(),
                SizedBox(height: GSizes.spaceBtwSections),
            
                ///............ Divider ...............
                GFormDivider(title: GTexts.orContinueWith),
                SizedBox(height: GSizes.spaceBtwSections),
            
                /// social buttons
                GSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
