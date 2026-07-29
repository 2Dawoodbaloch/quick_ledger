import 'package:flutter/material.dart';

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