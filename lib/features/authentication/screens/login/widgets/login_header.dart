import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class GLoginHeader extends StatelessWidget {
  const GLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
 
      children: [
        /// title , subtitle
        Text(
          GTexts.welcomeBack,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: GSizes.xs),
        Text(
         GTexts.logInSubtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
