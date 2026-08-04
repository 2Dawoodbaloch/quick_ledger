import 'package:flutter/material.dart';
import 'package:quick_ledger/common/widgets/images/circular_images.dart';
import 'package:quick_ledger/utils/constants/images.dart';
class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return GCircularImage(
      image: GImages.homeIcon,
      height: 120.0,
      width: 120,
      borderWidth: 5,
      padding: 0,
    );
  }
}
