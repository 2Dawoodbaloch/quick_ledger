import 'package:flutter/material.dart';
import 'package:quick_ledger/common/widgets/custom_shapes/circular_container.dart';
import 'package:quick_ledger/common/widgets/custom_shapes/colors.dart';
import 'package:quick_ledger/common/widgets/custom_shapes/rounded_container.dart';
import 'package:quick_ledger/common/widgets/custom_shapes/sizes.dart';

class GPrimaryHeaderContainer extends StatelessWidget {
  const GPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GRoundedContainer(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),

            //
            child,
          ],
        ),
      ),
    );
  }
}
