import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class GSearchBar extends StatelessWidget {
  const GSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = GHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: 0,
      right: GSizes.spaceBtwSections,
      left: GSizes.spaceBtwSections,
      child: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: 'search_animation',
          child: Container(
            height: GSizes.searchbarHeight,
            padding: const EdgeInsets.symmetric(horizontal: GSizes.md),
            decoration: BoxDecoration(
              color: dark ? GColors.dark : Colors.white,
              borderRadius: BorderRadius.circular(GSizes.buttonRadius),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: GColors.darkGrey),
                const SizedBox(width: GSizes.spaceBtwItems),
                Text(
                  GTexts.searchJournalEntries,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
