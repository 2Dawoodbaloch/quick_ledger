import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:quick_ledger/common/style/padding.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/constants/images.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/device_helpers.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAllNamed( RoutesName.login),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: GPadding.screenPadding,
          child: Column(
            children: [
              // images
              Image.asset(
                GImages.facebookIcon,
                height: GDeviceHelper.getScreenHeight(context) * 0.6,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///title
              Text(
                GTexts.resetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///email
              Text(
                'unknownpro@gmail.com',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///subtitle
              Text(
                GTexts.resetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///done
              GElevatedButton(onPressed: () {}, child: Text(GTexts.done)),
              SizedBox(height: GSizes.spaceBtwItems),

              ///resend email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(GTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
