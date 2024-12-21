import 'package:flutter/material.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor = ColorsManager.backgroundColor,
    this.titleStyle,
    this.leading,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: titleStyle ?? TextStyles.font18Meduim.copyWith(color: ColorsManager.white),
      ),
      leading: showBackButton
          ? leading ??
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
