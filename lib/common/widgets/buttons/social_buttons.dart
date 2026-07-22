import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/images.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class GSocialButtons extends StatelessWidget {
  const GSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(GImages.googleIcon, (){}),
        SizedBox(width: GSizes.spaceBtwItems),
        buildButton(GImages.facebookIcon, () {}),
      ],
    );
  }

  Container buildButton(String image, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(image, height: GSizes.iconMd, width: GSizes.iconMd),
      ),
    );
  }
}
