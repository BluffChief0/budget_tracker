import 'dart:async';

import 'package:budget_tracker/logic/models/transaction.dart';
import 'package:cubit_form/cubit_form.dart';

class TransactionFormCubit extends FormCubit {
  TransactionFormCubit({this.transaction}) {
    type = FieldCubit<TransactionType?>(
        initalValue: transaction?.type,
        validations: [
          RequiredNotNullValidation('Это поле должно быть заполнено'),
        ]);
    category = FieldCubit<TransactionCategory?>(
        initalValue: transaction?.category,
        validations: [
          RequiredNotNullValidation('Это поле должно быть заполнено'),
        ]);
    sum = FieldCubit<String>(
        initalValue: transaction?.sum.toString() ?? '',
        validations: [
          RequiredStringValidation('Это поле должно быть заполнено'),
        ]);
    date = FieldCubit<String>(
        initalValue: transaction?.date.toString() ?? '',
        validations: [
          RequiredStringValidation('Это поле должно быть заполнено'),
        ]);

    addFields([type, category, sum, date]);
  }

  final Transaction? transaction;

  late FieldCubit<TransactionType?> type;
  late FieldCubit<TransactionCategory?> category;
  late FieldCubit<String> sum;
  late FieldCubit<String> date;

  @override
  FutureOr<bool> asyncValidation() {
    double? sumDouble = double.tryParse(sum.state.value);
    if (sumDouble == null) {
      sum.setError('Сумма должна быть целым числом');
      return false;
    }
    return true;
  }

  @override
  FutureOr<void> onSubmit() {}
}
