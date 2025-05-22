import 'package:budget_tracker/logic/models/transaction.dart';
import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:fl_chart/fl_chart.dart';

double getSumBySomeTransactions(List<Transaction> transactions) {
  double sum = 0;
  for (final transaction in transactions) {
    final doubleSum = double.parse(transaction.sum);
    sum += doubleSum;
  }
  return sum;
}

List<PieChartSectionData> getStatisticsByTransactionType(
    List<Transaction> transactions) {
  final replenishments = transactions
      .where((t) => t.type == TransactionType.replenishment)
      .toList();
  final writeoffs =
      transactions.where((t) => t.type == TransactionType.writeoff).toList();
  return [
    PieChartSectionData(
      value: getSumBySomeTransactions(replenishments),
      color: BrandColors.green,
      title: 'Зачисления\n${getSumBySomeTransactions(replenishments)} ₽',
      titleStyle: BrandTypography.body,
    ),
    PieChartSectionData(
      value: getSumBySomeTransactions(writeoffs),
      color: BrandColors.error,
      title: 'Списания\n${getSumBySomeTransactions(writeoffs)} ₽',
      titleStyle: BrandTypography.body,
    ),
  ];
}

List<PieChartSectionData> getWriteoffStatisticsByCategoryType(
    List<Transaction> transactions) {
  final List<PieChartSectionData> sections = [];
  for (TransactionCategory category in TransactionCategory.values) {
    final categoryTransactions = transactions
        .where(
            (t) => t.category == category && t.type == TransactionType.writeoff)
        .toList();
    sections.add(PieChartSectionData(
      value: getSumBySomeTransactions(categoryTransactions),
      color: category.color,
      title:
          '${category.name}\n${getSumBySomeTransactions(categoryTransactions)} ₽',
      titleStyle: BrandTypography.body,
    ));
  }

  return sections;
}
