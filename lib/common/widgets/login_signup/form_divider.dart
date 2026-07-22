import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GFormDivider extends StatelessWidget {
  const GFormDivider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.5,
    
            color: dark ? GColors.darkGrey : GColors.grey,
          ),
        ),
        Text(title, style: Theme.of(context).textTheme.labelMedium),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            thickness: 0.5,
   
            color: dark ? GColors.darkGrey : GColors.grey,
          ),
        ),
      ],
    );
  }
}
