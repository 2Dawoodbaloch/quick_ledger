import 'package:flutter/widgets.dart';

class ReportItem {
  final String title;
  final String subtitle;
  final String trailing;
  final IconData icon;
  final VoidCallback onTap;

  ReportItem({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.icon,
    required this.onTap,
  });
}