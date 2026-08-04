import 'package:flutter/material.dart';
import 'package:quick_ledger/common/style/padding.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/device_helpers.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.onTap,
  });
  final String title, subTitle, image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: GPadding.screenPadding,
          child: Column(
            children: [
              // images
              Image.asset(
                image,
                height: GDeviceHelper.getScreenHeight(context) * 0.6,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///email
              // Text(
              //   'unknownpro@gmail.com',
              //   style: Theme.of(context).textTheme.bodyMedium,
              // ),
              // SizedBox(height: USizes.spaceBtwItems),

              ///subtitle
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: GSizes.spaceBtwItems),

              ///continue
              GElevatedButton(onPressed: onTap, child: Text(GTexts.uContinue)),
              SizedBox(height: GSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
