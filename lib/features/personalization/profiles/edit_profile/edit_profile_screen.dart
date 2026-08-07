import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/personalization/profiles/controller/edit_profile_controller.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/validators/validation.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            TextFormField(
              controller: controller.name,
              validator: (value) =>
                  GValidator.validateEmptyText("Name", value),
              decoration: const InputDecoration(
                labelText: "Full Name",
              ),
            ),

            const SizedBox(height: GSizes.spaceBtwInputFields),

            TextFormField(
              controller: controller.phone,
              validator: GValidator.validatePhoneNumber,
              decoration: const InputDecoration(
                labelText: "Phone",
              ),
            ),

            const SizedBox(height: GSizes.spaceBtwInputFields),

            TextFormField(
              controller: controller.businessName,
              decoration: const InputDecoration(
                labelText: "Business Name",
              ),
            ),

            const SizedBox(height: GSizes.spaceBtwInputFields),

            TextFormField(
              controller: controller.businessType,
              decoration: const InputDecoration(
                labelText: "Business Type",
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: controller.updateProfile,
                child: const Text("Save Changes"),
              ),
            )
          ],
        ),
      ),
    );
  }
}