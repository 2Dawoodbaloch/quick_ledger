import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/helpers/device_helpers.dart';

class GElevatedButton extends StatelessWidget {
  const GElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: GDeviceHelper.getScreenWidth(context),
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}
