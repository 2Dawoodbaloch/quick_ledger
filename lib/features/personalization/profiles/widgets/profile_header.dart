import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_ledger/features/personalization/controllers/user_controller.dart';
import 'package:quick_ledger/features/personalization/profiles/controller/edit_profile_controller.dart';

class GProfileHeader extends StatelessWidget {

  const GProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final user =UserController.instance.user.value;

    return Column(

      children: [

        const CircleAvatar(
          radius: 45,
          child: Icon(Icons.person,size:40),
        ),

        const SizedBox(height:16),

        Text(
          user.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}