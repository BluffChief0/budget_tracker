import 'package:budget_tracker/ui/components/brand_text_field.dart';
import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BrandDatePicker extends StatelessWidget {
  const BrandDatePicker({super.key, required this.fieldCubit});
  final FieldCubit<String> fieldCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final res = await showCalendarDatePicker2Dialog(
          context: context,
          config: CalendarDatePicker2WithActionButtonsConfig(
            firstDate: DateTime(1950),
            selectedDayHighlightColor: BrandColors.accent,
          ),
          dialogSize: const Size(325, 400),
          dialogBackgroundColor: BrandColors.white,
          borderRadius: BorderRadius.circular(16),
        );
        if (res != null && res.isNotEmpty) {
          // TODO there could be problem with minutes
          fieldCubit.setValue(
            DateFormat('dd.MM.yyyy').format(
              res[0]!,
            ),
          );
        }
      },
      child: BrandTextField(
        label: 'Выберите дату транзакции',
        fieldCubit: fieldCubit,
        enabled: false,
      ),
    );
  }
}
