import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/model/reports/report_item_model.dart';
import 'package:quick_ledger/routes/routes_name.dart';

class ReportsController extends GetxController {
  static ReportsController get instance => Get.find();

  List<ReportItem> get reports => [
        ReportItem(
          title: "Profit & Loss",
          subtitle: "Income vs expenses",
          trailing: "\$0",
          icon: Icons.show_chart,
          onTap: () {
           Get.toNamed(RoutesName.profitLoss);
          },
        ),

ReportItem(
  title: "Trial Balance",
  subtitle: "Check debit and credit",
  icon: Icons.balance,
  trailing: "",
  onTap: () {
    Get.toNamed(RoutesName.trialBalance);
  },
),

        ReportItem(
          title: "General Ledger",
          subtitle: "Entries by account",
          trailing:
              "${JournalController.instance.allEntries.length} entries",
          icon: Icons.menu_book,
          onTap: () {
            Get.toNamed(RoutesName.generalLedger);
          },
        ),

        ReportItem(
          title: "Balance Sheet",
          subtitle: "Assets, liabilities, equity",
          trailing: "\$0",
          icon: Icons.account_balance,
          onTap: () {
          Get.toNamed(RoutesName.balanceSheet);
          },
        ),
      ];
}