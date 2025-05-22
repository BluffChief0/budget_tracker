import 'package:budget_tracker/ui/theme/brand_colors.dart';
import 'package:budget_tracker/ui/theme/brand_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BrandAppBar({
    super.key,
    required this.title,
    this.needLeading = true,
  });
  final String title;
  final bool needLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: BrandTypography.title.copyWith(
          color: BrandColors.white,
        ),
      ),
      backgroundColor: BrandColors.accent,
      elevation: 10,
      leading: needLeading
          ? InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                CupertinoIcons.chevron_back,
                color: BrandColors.white,
              ),
            )
          : const SizedBox.shrink(),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
