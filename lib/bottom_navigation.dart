import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
import 'package:quick_ledger/features/ledger/screens/journals/gernals.dart';
import 'package:quick_ledger/features/ledger/screens/reports/reports.dart';
import 'package:quick_ledger/home.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool dark = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          backgroundColor: dark ? GColors.dark : GColors.light,
          indicatorColor: dark
              ? GColors.light.withValues(alpha: 0.1)
              : GColors.dark.withValues(alpha: 0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.menu_book), label: 'Journals'),
            NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'Reports'),
            NavigationDestination(icon: Icon(Iconsax.bank), label: 'Accounts'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    JournalsScreen(),
    ReportsScreen(),
    AccountsScreen(),
  ];
}
