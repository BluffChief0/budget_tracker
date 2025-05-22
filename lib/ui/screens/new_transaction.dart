import 'package:budget_tracker/logic/bloc/all_transactions_cubit/all_transactions_cubit.dart';
import 'package:budget_tracker/logic/bloc/transaction_form_cubit.dart';
import 'package:budget_tracker/logic/models/transaction.dart';
import 'package:budget_tracker/logic/utils/id_generator.dart';
import 'package:budget_tracker/ui/components/brand_app_bar.dart';
import 'package:budget_tracker/ui/components/brand_button.dart';
import 'package:budget_tracker/ui/components/brand_date_picker.dart';
import 'package:budget_tracker/ui/components/brand_text_field.dart';
import 'package:budget_tracker/ui/components/dropdown.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionFormCubit(),
      child: Builder(builder: (context) {
        final formCubit = BlocProvider.of<TransactionFormCubit>(context);
        return Scaffold(
          appBar: const BrandAppBar(
            title: 'Новая транзакция',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Выбери категорию транзакции',
                  style: BrandTypography.body,
                ),
                Dropdown(
                  fieldCubit: formCubit.category,
                  items: TransactionCategory.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              Text(
                                e.name,
                                style: BrandTypography.body,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(e.icon),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Выбери тип транзакции',
                  style: BrandTypography.body,
                ),
                Dropdown(
                  fieldCubit: formCubit.type,
                  items: TransactionType.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                            style: BrandTypography.body,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                BrandTextField(
                  fieldCubit: formCubit.sum,
                  label: 'Введите сумму транзакции',
                ),
                const SizedBox(
                  height: 16,
                ),
                BrandDatePicker(
                  fieldCubit: formCubit.date,
                ),
                const SizedBox(
                  height: 48,
                ),
                BlocConsumer<TransactionFormCubit, FormCubitState>(
                  listener: (context, state) {
                    if (state.isSubmitted) {
                      final Transaction transaction = Transaction(
                        id: idGenerator(),
                        date: formCubit.date.state.value,
                        sum: formCubit.sum.state.value,
                        type: formCubit.type.state.value!,
                        category: formCubit.category.state.value!,
                      );
                      BlocProvider.of<AllTransactionsCubit>(context)
                          .addNewTransaction(transaction);
                      Navigator.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    return BrandButton(
                      onTap: () => formCubit.trySubmit(),
                      text: 'Добавить транзакцию',
                      disabled: !state.isFormDataValid,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
