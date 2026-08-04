import 'package:flutter/cupertino.dart';
import 'package:quick_ledger/common/widgets/custom_shapes/clipper/custom_rounded_clipper.dart';

class GRoundedEdgesContainer extends StatelessWidget {
  const GRoundedEdgesContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UCustomRoundedEdges(), child: child);
  }
}
