import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class AccountController extends GetxController {
  static AccountController get instance => Get.find();

  /// Starts empty on purpose — same reasoning as JournalController.
  /// This is what makes AccountsScreen show its empty state by
  /// default for a new user.
  final RxList<AccountModel> allAccounts = <AccountModel>[].obs;

  /// Grouped in standard accounting order: Assets, Liabilities,
  /// Equity, Income, Expenses. Only non-empty groups are included, so
  /// the screen doesn't render an empty "Equity" header with nothing
  /// under it just because no equity account has been added yet.
  Map<AccountType, List<AccountModel>> get groupedAccounts {
    final Map<AccountType, List<AccountModel>> groups = {};
    for (final type in AccountType.values) {
      final accountsOfType = allAccounts.where((a) => a.type == type).toList();
      if (accountsOfType.isNotEmpty) {
        groups[type] = accountsOfType;
      }
    }
    return groups;
  }

  void addAccount(AccountModel account) => allAccounts.add(account);
}