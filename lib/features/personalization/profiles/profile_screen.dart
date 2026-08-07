import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:quick_ledger/features/personalization/controllers/user_controller.dart';
import 'package:quick_ledger/features/personalization/profiles/widgets/logout_button.dart';
import 'package:quick_ledger/features/personalization/profiles/widgets/profile_action_tile.dart';
import 'package:quick_ledger/features/personalization/profiles/widgets/profile_header.dart';
import 'package:quick_ledger/features/personalization/profiles/widgets/profile_info_tile.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),

      body: Obx(() {
        final user = controller.user.value;
        // if(user == null){
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
//
        return ListView(
          padding: const EdgeInsets.all(20),

          children: [
            const GProfileHeader(),

            const SizedBox(height: 30),

            GProfileInfoTile(title: "Business Name", value: user.businessName),
            SizedBox(height: GSizes.spaceBtwItems),
            GProfileInfoTile(title: "Business Type", value: user.businessType),
            SizedBox(height: GSizes.spaceBtwItems),
            GProfileInfoTile(title: "Phone", value: user.phone),

            const SizedBox(height: 25),

            GProfileActionTile(
              icon: Icons.edit,
              title: "Edit Profile",
              onTap: () {
                Get.toNamed(RoutesName.editProfile);
              },
            ),
            GProfileActionTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {
                Get.toNamed(RoutesName.changePassword);
              },
            ),

            GProfileActionTile(
              icon: Icons.info_outline,
              title: "About",
              onTap: () {
                Get.toNamed(RoutesName.aboutScreen);
              },
            ),

            const SizedBox(height: 30),

            const GLogoutButton(),
          ],
        );
      }),
    );
  }
}
