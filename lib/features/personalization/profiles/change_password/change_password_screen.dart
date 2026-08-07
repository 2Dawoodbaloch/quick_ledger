import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/features/personalization/profiles/about_screen/controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final controller = ChangePasswordController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [

              TextFormField(
                controller: controller.currentPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Current Password",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: controller.newPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "New Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  if (value.length < 6) {
                    return "Minimum 6 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: controller.confirmPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: GElevatedButton(
                  onPressed: controller.changePassword,
                  child: const Text("Update Password"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}