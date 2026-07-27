import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/home/balance_account_model.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/balance_row.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class GBalanceSection extends StatelessWidget {
  const GBalanceSection({
    super.key,
    required this.title,
    required this.total,
  });

  final String title;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [

            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const Spacer(),

            Text(
              total,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      
      ],
    );
  }
}