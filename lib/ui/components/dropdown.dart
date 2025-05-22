import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.fieldCubit,
    required this.items,
  });
  final FieldCubit<T> fieldCubit;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: fieldCubit,
        builder: (context, state) {
          return DropdownButton<T>(
            value: fieldCubit.state.value,
            padding: const EdgeInsets.all(12),
            borderRadius: BorderRadius.circular(12),
            icon: const Icon(
              CupertinoIcons.chevron_down,
              color: BrandColors.accent,
            ),
            elevation: 16,
            style: BrandTypography.body,
            underline: Container(height: 1, color: BrandColors.accent),
            onChanged: (T? value) {
              if (value != null) {
                fieldCubit.setValue(value);
              }
            },
            items: items,
          );
        });
  }
}
