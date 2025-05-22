import 'package:budget_tracker/logic/bloc/all_transactions_cubit/all_transactions_cubit.dart';
import 'package:budget_tracker/logic/utils/statistics.dart';
import 'package:budget_tracker/ui/components/brand_app_bar.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrandAppBar(title: 'Статистика'),
      body: BlocBuilder<AllTransactionsCubit, AllTransactionsState>(
        builder: (context, state) {
          if (state is AllTransactionsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Статистика зачислений и списаний',
                  style: BrandTypography.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      sections: getStatisticsByTransactionType(
                        state.transactions,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Статистика списаний по категориям',
                  style: BrandTypography.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      sections: getWriteoffStatisticsByCategoryType(
                        state.transactions,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('Что-то пошло не так'));
        },
      ),
    );
  }
}
