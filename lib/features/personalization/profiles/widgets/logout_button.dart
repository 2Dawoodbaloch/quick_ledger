import 'package:flutter/material.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';

class GLogoutButton extends StatelessWidget {

  const GLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {

    return FilledButton.icon(

      onPressed: () {

        AuthenticationRepository.instance.logout();

      },

      icon: const Icon(Icons.logout),

      label: const Text("Logout"),
    );
  }
}