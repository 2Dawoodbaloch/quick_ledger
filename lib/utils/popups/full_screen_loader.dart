import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GFullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: GHelperFunctions.isDarkMode(Get.context!) ? GColors.dark : GColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(text, style: const TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }

 static void stopLoading() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}
}