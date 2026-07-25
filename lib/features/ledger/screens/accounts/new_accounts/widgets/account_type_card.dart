import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/widgets/account_type_chip.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import '../../../../../../utils/constants/sizes.dart';

class GAccountTypeCard extends StatelessWidget {
  const GAccountTypeCard({
    super.key,
    required this.selectedType,
  });

  final AccountType selectedType;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(GSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account type determines placement',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: GSizes.spaceBtwItems),
            Wrap(
              spacing: GSizes.sm,
              runSpacing: GSizes.sm,
              children: AccountType.values.map((type) {
                return GAccountTypeChip(
                  type: type,
                  isSelected: selectedType == type,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}