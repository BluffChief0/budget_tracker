part of 'all_transactions_cubit.dart';

sealed class AllTransactionsState extends Equatable {
  const AllTransactionsState();
  @override
  List<Object> get props => [];
}

final class AllTransactionsInitial extends AllTransactionsState {}

final class AllTransactionsLoaded extends AllTransactionsState {
  final List<Transaction> transactions;

  const AllTransactionsLoaded({required this.transactions});

  @override
  List<Object> get props => [transactions];
}
