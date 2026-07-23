import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class GFullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: GHelperFunctions.isDarkMode(Get.context!)
              ? GColors.dark
              : GColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              /// Extra Space
              const SizedBox(height: 250),

              /// Animation
              Text(text)
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
