import 'dart:convert';

import 'package:budget_tracker/logic/models/transaction.dart';
import 'package:budget_tracker/logic/storage_service/storage_service.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:equatable/equatable.dart';

part 'all_transactions_state.dart';

class AllTransactionsCubit extends Cubit<AllTransactionsState> {
  AllTransactionsCubit() : super(AllTransactionsInitial());

  void getTransactions() {
    final rawData = StorageService.getValueStr('transactions') ?? '[]';

    final transactions = parseJsonToTransactionsList(
        List<Map<String, dynamic>>.from(jsonDecode(rawData)));
    emit(AllTransactionsLoaded(transactions: transactions));
  }

  void addNewTransaction(Transaction transaction) {
    if (state is AllTransactionsLoaded) {
      final transactions = (state as AllTransactionsLoaded).transactions;
      transactions.add(transaction);
      StorageService.setValueStr('transactions',
          jsonEncode(parseTransactionsListToJson(transactions)));
      emit(AllTransactionsLoaded(transactions: [...transactions]));
    }
  }
}
