import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/widgets/chips/choice_chip.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/common/widgets/text_fields/search_bar.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/model/journal/widget/journal_filter_chips.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

/// No Scaffold here on purpose — NavigationMenu owns the single
/// Scaffold, bottom nav bar, and FloatingActionButton for the whole
/// app shell. This screen is just the body content for the Journals
/// tab. If you need an app bar with a title, add it inside this
/// Column (not as Scaffold.appBar), or lift title display into
/// NavigationMenu based on selectedIndex.
class JournalsScreen extends StatelessWidget {
  JournalsScreen({super.key});

  final controller = Get.put(JournalController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              GTexts.journals,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: GSizes.spaceBtwItems),
            // Search bar and filter chips are dimmed (not removed)
            // when there's nothing to search/filter yet — same
            // pattern used in the empty-state mockup.

            // final isEmpty = controller.allEntries.isEmpty;
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GSearchBar(),
                const SizedBox(height: GSizes.spaceBtwItems),
                Obx(
                  () => GJournalFilterChips(
                    selected: controller.selectedFilter.value,
                    onSelect: controller.setFilter,
                  ),
                ),
              ],
            ),

            const SizedBox(height: GSizes.spaceBtwSections),

            // Main content — empty state or the real list. This is
            // the exact same isEmpty-check pattern from Home.
            Expanded(
              child: Obx(() {
                if (controller.allEntries.isEmpty) {
                  return Center(
                    child: GEmptyState(
                      icon: Icons.menu_book_outlined,
                      title: GTexts.noJournalEntriesYet,
                      subtitle: GTexts.noJournalEntriesSubtitle,
                      buttonLabel: '+ ${GTexts.newJournalEntry}',
                      onButtonTap: () {
                        // TODO: navigate to new journal entry screen
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
