import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/reports/report_item_model.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GReportCard extends StatelessWidget {
  const GReportCard({
    super.key,
    required this.report,
  });

  final ReportItem report;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return InkWell(
      borderRadius: BorderRadius.circular(GSizes.cardRadiusLg),
      onTap: report.onTap,
      child: Container(
        padding: const EdgeInsets.all(GSizes.md),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
          border: Border.all(
            color: dark ? GColors.borderDark : GColors.white,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [

            // Report Icon
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: dark ? GColors.dark : GColors.white,
                borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
              ),
              child: Icon(
                report.icon,
                size: 22,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(width: GSizes.md),


            // Title + Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    report.subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            // -------------------------------------------------------
            // Value + Arrow
            // -------------------------------------------------------
            Row(
              children: [
                Text(
                  report.trailing,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: GSizes.sm),
                const Icon(
                  Icons.chevron_right,
                  size: GSizes.iconMd,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}