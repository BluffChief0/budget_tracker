import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  const BrandButton({
    super.key,
    required this.onTap,
    required this.text,
    this.disabled = false,
  });
  final VoidCallback onTap;
  final String text;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            height: 48,
            decoration: BoxDecoration(
              color: disabled ? BrandColors.grey : BrandColors.accent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: BrandTypography.bodyBold.copyWith(
                color: BrandColors.white,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
