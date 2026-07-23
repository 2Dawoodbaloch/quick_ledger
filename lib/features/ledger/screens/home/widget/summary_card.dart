import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
class GSummaryCard extends StatelessWidget {
  const GSummaryCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: GSizes.md,
          horizontal: GSizes.xs,
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: GSizes.iconSm),
            const SizedBox(height: GSizes.xs),
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 2),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: iconColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}