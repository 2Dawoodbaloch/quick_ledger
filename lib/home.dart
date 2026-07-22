import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:quick_ledger/features/authentication/screens/login/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(onPressed: (){
          Get.to(LoginScreen());
        }, icon: Icon(Icons.cloud_circle)),
      ),
    );
  }
}