import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

/// Shared empty state used on Home, Journals, Accounts, and Reports.
/// This is not a separate screen — it's swapped in by whichever screen
/// is using it, based on whether its data list is empty, e.g.:
///
///   Obx(() => controller.items.isEmpty
///     ? GEmptyState(icon: ..., title: ..., subtitle: ..., buttonLabel: ..., onButtonTap: ...)
///     : GTheRealPopulatedList(...))
class GEmptyState extends StatelessWidget {
  const GEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonLabel,
    this.onButtonTap,
    this.secondaryLabel,
    this.onSecondaryTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonLabel;
  final VoidCallback? onButtonTap;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: GSizes.xxl, horizontal: GSizes.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(GSizes.radiusLg),
        border: Border.all(
          color: dark ? GColors.borderDark : GColors.lightGrey,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: dark ? GColors.primary.withValues(alpha: 0.18) : GColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: GSizes.iconLg, color: dark ? GColors.primaryLight : GColors.primary),
          ),
          const SizedBox(height: GSizes.md),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: GSizes.xs),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (buttonLabel != null) ...[
            const SizedBox(height: GSizes.md),
            ElevatedButton(
              onPressed: onButtonTap,
              child: Text(buttonLabel!),
            ),
          ],
          if (secondaryLabel != null) ...[
            const SizedBox(height: GSizes.xs),
            TextButton(
              onPressed: onSecondaryTap,
              child: Text(secondaryLabel!),
            ),
          ],
        ],
      ),
    );
  }
}