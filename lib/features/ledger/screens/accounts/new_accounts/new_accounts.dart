import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/style/padding.dart';
import 'package:quick_ledger/common/widgets/buttons/elevated_button.dart';
import 'package:quick_ledger/common/widgets/text_field.dart/drop_down_field.dart';
import 'package:quick_ledger/common/widgets/text_field.dart/form_field.dart';
import 'package:quick_ledger/features/ledger/controllers/new_account/controller.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/widgets/account_type_card.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class NewAccountScreen extends StatelessWidget {
  NewAccountScreen({super.key});

  final controller = Get.find<NewAccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(title: Text(GTexts.newAccount)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              
              /// Account Name
              GFormField(
                label: GTexts.accountName,
                hintText: 'e.g. Office supplies',
                controller: controller.accountNameController,
              ),

              const SizedBox(height: GSizes.spaceBtwItems),

              /// Account Code & Type
              Row(
                children: [
                  Expanded(
                    child: GFormField(
                      label: GTexts.accountCode,
                      controller: controller.accountCodeController,
                      // keyboardType: TextInputType.number,
                    ),
                  ),

                  const SizedBox(width: GSizes.spaceBtwItems),

                  Expanded(
                    child: Obx(
                      () => GDropdownField<AccountType>(
                        label: GTexts.accounts,
                        value: controller.selectedType.value,
                        items: AccountType.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.label),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => controller.setAccountType,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: GSizes.spaceBtwItems),

              /// Category Preview
              Obx(
                () => GAccountTypeCard(
                  selectedType: controller.selectedType.value,
                ),
              ),

              const SizedBox(height: GSizes.spaceBtwItems),

              /// Opening Balance
              GFormField(
                label: GTexts.openingBalance,
                hintText: '0.00',
                controller: controller.openingBalanceController,
                // keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),

              const SizedBox(height: GSizes.spaceBtwItems),

              /// Description
              GFormField(
                label: GTexts.description,
                hintText: 'What is this account used for?',
                controller: controller.descriptionController,
              ),

              const SizedBox(height: GSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: GElevatedButton(
                  onPressed: controller.createAccount,
                  child: Text(GTexts.createAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
