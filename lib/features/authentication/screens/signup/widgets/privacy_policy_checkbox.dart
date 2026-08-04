import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quick_ledger/features/authentication/controllers/signup/signup_controller.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GPrivacyPolicyCheckBox extends StatelessWidget {
  const GPrivacyPolicyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) {
              controller.privacyPolicy.value = value ?? false;
            },
          ),
        ),

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
