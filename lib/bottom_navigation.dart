// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
// import 'package:quick_ledger/features/ledger/screens/home/home.dart';
// import 'package:quick_ledger/features/ledger/screens/journals/journal.dart';
// import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
// import 'package:quick_ledger/features/ledger/screens/reports/reports.dart';
// import 'package:quick_ledger/routes/routes_name.dart';
// import 'package:quick_ledger/utils/constants/colors.dart';
// import 'package:quick_ledger/utils/helpers/helper_functions.dart';

// class NavigationMenu extends StatefulWidget {
//   const NavigationMenu({super.key});

//   @override
//   State<NavigationMenu> createState() => _NavigationMenuState();
// }

// class _NavigationMenuState extends State<NavigationMenu> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//     bool dark = GHelperFunctions.isDarkMode(context);

//     return Scaffold(
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),

//       // centerDocked places the FAB centered horizontally, floating
//       // just above the bottomNavigationBar. It's hidden entirely
//       // (not just disabled) on Home and Journals when there's no
//       // data yet — an "add" button doesn't earn its place on screen
//       // until there's something to add to, and Home's "recent
//       // transactions" is really just a view onto the same
//       // JournalController data, so both tabs share one condition.
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Obx(() {
//         final index = controller.selectedIndex.value;
//         final isHomeOrJournals = index == 0 || index == 1;
//         final noEntriesYet = JournalController.instance.allEntries.isEmpty;

//         if (isHomeOrJournals && noEntriesYet) {
//           return const SizedBox.shrink();
//         }

//         return FloatingActionButton.small(
//           backgroundColor: dark ? GColors.textPrimaryDark : GColors.dark,
//           foregroundColor: dark ? GColors.scaffoldDark : GColors.white,
//           elevation: 0,
//           shape: const CircleBorder(),
//           onPressed: () => controller.onAddTap(),
//           child: const Icon(Icons.add),
//         );
//       }),

//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           elevation: 0,
//           backgroundColor: dark ? GColors.dark : GColors.light,
//           indicatorColor: dark
//               ? GColors.light.withValues(alpha: 0.1)
//               : GColors.dark.withValues(alpha: 0.1),
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) {
//             controller.selectedIndex.value = index;
//           },
//           destinations: [
//             NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
//             NavigationDestination(icon: Icon(Icons.menu_book), label: 'Journals'),
//             NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'Reports'),
//             NavigationDestination(icon: Icon(Iconsax.bank), label: 'Accounts'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   static NavigationController get instance => Get.find();
//   RxInt selectedIndex = 0.obs;

//   List<Widget> screens = [
//     HomeScreen(),
//     JournalsScreen(),
//     ReportsScreen(),
//     AccountsScreen(),
//   ];

//   /// The "+" button's action depends on which tab is currently active —
//   /// same context-aware behavior discussed earlier: on Journals it
//   /// goes straight to New Journal Entry, on Accounts straight to New
//   /// Account. Home/Reports fall back to Journals for now since they
//   /// don't have their own dedicated "add" screen.
//   void onAddTap() {
//     switch (selectedIndex.value) {
//       case 1: // Journals
//         Get.toNamed(RoutesName.newJournalEntry);
//         break;
//       case 3: // Accounts
//         Get.toNamed(RoutesName.newAccounts);
//         break;
//       default: // Home, Reports
//         Get.toNamed(RoutesName.home);
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
// import 'package:quick_ledger/features/ledger/screens/home/home.dart';
// import 'package:quick_ledger/features/ledger/screens/journals/journal.dart';
// import 'package:quick_ledger/features/ledger/screens/reports/reports.dart';
// import 'package:quick_ledger/routes/routes_name.dart';
// import 'package:quick_ledger/utils/constants/colors.dart';
// import 'package:quick_ledger/utils/helpers/helper_functions.dart';

// class NavigationMenu extends StatefulWidget {
//   const NavigationMenu({super.key});

//   @override
//   State<NavigationMenu> createState() => _NavigationMenuState();
// }

// class _NavigationMenuState extends State<NavigationMenu> {
//       final controller = Get.put(NavigationController());

      
//   @override
//   Widget build(BuildContext context) {

//     bool dark = GHelperFunctions.isDarkMode(context);

//     return Scaffold(
      
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
  

//       // centerDocked places the FAB centered horizontally, floating
//       // just above the bottomNavigationBar — this is what gives the
//       // "little above the bar" raised look from the mockup, using
//       // Scaffold's built-in positioning instead of manual margins.
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
//       floatingActionButton: FloatingActionButton.small(
        
//         backgroundColor: dark ? GColors.textPrimaryDark : GColors.dark,
//         foregroundColor: dark ? GColors.scaffoldDark : GColors.white,
//         elevation: 0,
//         shape: const CircleBorder(),
//         onPressed: () => controller.onAddTap(),
//         child: const Icon(Icons.add),
//       ),

//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           elevation: 0,
//           backgroundColor: dark ? GColors.dark : GColors.light,
//           indicatorColor: dark
//               ? GColors.light.withValues(alpha: 0.1)
//               : GColors.dark.withValues(alpha: 0.1),
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) {
//             controller.selectedIndex.value = index;
//           },
//           destinations: [
//             NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
//             NavigationDestination(icon: Icon(Icons.menu_book), label: 'Journals'),
//             NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'Reports'),
//             NavigationDestination(icon: Icon(Iconsax.bank), label: 'Accounts'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   static NavigationController get instance => Get.find();
//   RxInt selectedIndex = 0.obs;

//   List<Widget> screens = [
//     HomeScreen(),
//     JournalsScreen(),
//     ReportsScreen(),
//     AccountsScreen(),
//   ];

//   /// The "+" button's action depends on which tab is currently active —
//   /// same context-aware behavior discussed earlier: on Journals it
//   /// goes straight to New Journal Entry, on Accounts straight to New
//   /// Account. Home/Reports fall back to Journals for now since they
//   /// don't have their own dedicated "add" screen.
//   void onAddTap() {
//     switch (selectedIndex.value) {
//       case 1: // Journals
//           Get.toNamed(RoutesName.journal);
//         break;
//       case 3: // Accounts
//          Get.toNamed(RoutesName.accounts); 
//         break;
//       default: // Home, Reports
//         Get.toNamed(RoutesName.journal);
//     }
//   }
// }

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