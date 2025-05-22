import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:flutter/material.dart';

class MainPageCard extends StatelessWidget {
  const MainPageCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: BrandColors.accent),
              ),
              child: Center(
                child: Text(
                  title,
                  style: BrandTypography.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
