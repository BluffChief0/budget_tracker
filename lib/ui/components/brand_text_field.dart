import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrandTextField extends StatelessWidget {
  const BrandTextField({
    super.key,
    required this.fieldCubit,
    required this.label,
    this.enabled = true,
    this.digitsOnly = false,
  });
  final FieldCubit<String> fieldCubit;
  final String label;
  final bool enabled;
  final bool digitsOnly;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: fieldCubit.state.value,
    );

    return BlocConsumer(
      bloc: fieldCubit,
      builder: (context, state) {
        return Column(
          children: [
            TextField(
              controller: controller,
              style: BrandTypography.body,
              inputFormatters: [
                if (digitsOnly) FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                fieldCubit.setValue(value);
              },
              decoration: InputDecoration(
                labelText: label,
                labelStyle: BrandTypography.body,
                enabled: enabled,
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                disabledBorder: border,
              ),
            ),
            if (fieldCubit.state.isErrorShown)
              Text(
                fieldCubit.state.error ?? '',
                style: BrandTypography.body.copyWith(
                  color: BrandColors.error,
                ),
              )
          ],
        );
      },
      listener: (context, state) {
        controller.text = fieldCubit.state.value;
      },
    );
  }
}

const border = UnderlineInputBorder(
  borderSide: BorderSide(
    color: BrandColors.accent,
  ),
);
