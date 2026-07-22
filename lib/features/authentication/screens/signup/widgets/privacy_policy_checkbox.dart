import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class UPrivacyPolicyCheckBox extends StatelessWidget {
  const UPrivacyPolicyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    // final controller = SignupController.Instance;
    return Row(
      children: [
    Checkbox(
            value: true,
            onChanged: (value){}),
        
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: GTexts.termsOfUse),
              TextSpan(
                text: ' ${GTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: dark ? GColors.white : GColors.grey,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? GColors.white : GColors.grey,
                ),
              ),
              TextSpan(text: '${GTexts.and} '),
              TextSpan(
                text: GTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: dark ? GColors.white : GColors.grey,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? GColors.white : GColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
