import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';


/// Greeting header shown at the top of the Home screen.
/// Presentational only — takes plain values as parameters instead of
/// reading a GetX controller directly. This keeps it reusable and easy
/// to preview/test without needing GetX set up.
class GHomeHeader extends StatelessWidget {
  const GHomeHeader({
    super.key,
    required this.greeting,
    required this.userName,
    required this.subtitle,
    this.onAvatarTap,
  });

  final String greeting;
  final String userName;
  final String subtitle;
  final VoidCallback? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$greeting, $userName',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: GSizes.sm),
        GestureDetector(
          onTap: onAvatarTap,
          child: CircleAvatar(
            radius: 19,
            backgroundColor: GColors.primaryLight,
            child: Icon(
              Icons.person_outline,
              size: GSizes.iconSm,
              color: dark ? GColors.dark : GColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}