import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GProfileActionTile extends StatelessWidget {

  const GProfileActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: Icon(icon),

      title: Text(title),

      trailing: const Icon(Icons.chevron_right),

      onTap: onTap,
    );
  }
}