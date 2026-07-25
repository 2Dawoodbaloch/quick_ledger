import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GStatusPill extends StatelessWidget {
  const GStatusPill({super.key, required this.status});

  final JournalStatus status;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final isPosted = status == JournalStatus.posted;

    final color = isPosted ? GColors.posted : GColors.draft;
    final bgColor = dark
        ? (isPosted ? GColors.postedBgDark : GColors.draftBgDark)
        : (isPosted ? GColors.postedBg : GColors.draftBg);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
      child: Text(
        status.label,
        style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }
}