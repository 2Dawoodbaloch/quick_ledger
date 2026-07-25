import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
import 'package:quick_ledger/features/ledger/screens/home/home.dart';
import 'package:quick_ledger/features/ledger/screens/journals/journal.dart';
import 'package:quick_ledger/features/ledger/screens/reports/reports.dart';
import 'package:quick_ledger/routes/routes_name.dart';
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

    bool dark = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
  

      // centerDocked places the FAB centered horizontally, floating
      // just above the bottomNavigationBar — this is what gives the
      // "little above the bar" raised look from the mockup, using
      // Scaffold's built-in positioning instead of manual margins.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      floatingActionButton: FloatingActionButton.small(
        
        backgroundColor: dark ? GColors.textPrimaryDark : GColors.dark,
        foregroundColor: dark ? GColors.scaffoldDark : GColors.white,
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: () => controller.onAddTap(),
        child: const Icon(Icons.add),
      ),

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

  /// The "+" button's action depends on which tab is currently active —
  /// same context-aware behavior discussed earlier: on Journals it
  /// goes straight to New Journal Entry, on Accounts straight to New
  /// Account. Home/Reports fall back to Journals for now since they
  /// don't have their own dedicated "add" screen.
  void onAddTap() {
    switch (selectedIndex.value) {
      case 1: // Journals
          Get.toNamed(RoutesName.journal);
        break;
      case 3: // Accounts
         Get.toNamed(RoutesName.accounts); 
        break;
      default: // Home, Reports
        Get.toNamed(RoutesName.journal);
    }
  }
}