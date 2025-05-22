import 'package:budget_tracker/logic/bloc/all_transactions_cubit/all_transactions_cubit.dart';
import 'package:budget_tracker/logic/navigation/router.dart';
import 'package:budget_tracker/logic/navigation/routes.dart';
import 'package:budget_tracker/logic/storage_service/storage_service.dart';
import 'package:budget_tracker/ui/components/brand_app_bar.dart';
import 'package:budget_tracker/ui/components/main_page_card.dart';
import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    StorageService.initService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllTransactionsCubit()..getTransactions(),
      child: MaterialApp(
        title: 'Flutter Budget Tracker App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: BrandColors.accent),
          useMaterial3: true,
        ),
        initialRoute: Routes.initialPage,
        onGenerateRoute: CustomRouter.generateRoute,
      ),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({
    super.key,
  });

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrandAppBar(
        title: 'Главная',
        needLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: <Widget>[
              MainPageCard(
                title: 'Новая транзакция',
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.newTransaction,
                  );
                },
              ),
              MainPageCard(
                title: 'История транзакций',
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.transactionsHistory,
                  );
                },
              ),
              MainPageCard(
                title: 'Статистика',
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.statistics,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
