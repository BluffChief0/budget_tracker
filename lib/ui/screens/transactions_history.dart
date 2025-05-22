import 'package:budget_tracker/logic/bloc/all_transactions_cubit/all_transactions_cubit.dart';
import 'package:budget_tracker/logic/models/transaction.dart';
import 'package:budget_tracker/ui/components/brand_app_bar.dart';
import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

class TransactionsHistory extends StatelessWidget {
  const TransactionsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrandAppBar(title: 'История транзакция'),
      body: BlocBuilder<AllTransactionsCubit, AllTransactionsState>(
        builder: (context, state) {
          if (state is AllTransactionsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: state.transactions
                  .map((t) => TransactionCard(transaction: t))
                  .toList(),
            );
          }
          return const Center(
            child: Text('Что-то пошло не так'),
          );
        },
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: BrandColors.accent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Text(
            transaction.type.name,
            style: BrandTypography.bodyBold.copyWith(
              color: transaction.type == TransactionType.replenishment
                  ? BrandColors.green
                  : BrandColors.error,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Категория: ${transaction.category.name}',
                style: BrandTypography.body,
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(transaction.category.icon),
            ],
          ),
          Text(
            '${transaction.sum} ₽',
            style: BrandTypography.bodyBold,
          ),
          Text(
            transaction.date,
            style: BrandTypography.body,
          ),
        ],
      ),
    );
  }
}
