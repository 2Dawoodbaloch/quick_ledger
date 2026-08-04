import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/common/widgets/dialog/create_dialog.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
import 'package:quick_ledger/features/ledger/screens/home/home.dart';
import 'package:quick_ledger/features/ledger/screens/journals/journal.dart';
import 'package:quick_ledger/features/ledger/screens/reports/reports.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton.small(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor:
            dark ? GColors.textPrimaryDark : GColors.dark,
        foregroundColor:
            dark ? GColors.scaffoldDark : GColors.white,
        onPressed: () => controller.showCreateDialog(),
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,

          onDestinationSelected: controller.changeTab,

          elevation: 0,

          backgroundColor:
              dark ? GColors.dark : GColors.light,

          indicatorColor: dark
              ? GColors.light.withValues(alpha: .1)
              : GColors.dark.withValues(alpha: .1),

          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),

            NavigationDestination(
              icon: Icon(Icons.menu_book),
              label: 'Journals',
            ),

            NavigationDestination(
              icon: Icon(Icons.analytics_outlined),
              label: 'Reports',
            ),

            NavigationDestination(
              icon: Icon(Iconsax.bank),
              label: 'Accounts',
            ),
          ],
        ),
      ),
    );
  }
}


class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    JournalsScreen(),
    ReportsScreen(),
    AccountsScreen(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void showCreateDialog() {
    Get.dialog(
      const GCreateDialog(),
      barrierDismissible: true,
    );
  }
}