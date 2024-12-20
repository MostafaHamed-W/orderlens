import 'package:flutter/material.dart';
import 'package:orderlens/core/helpers/extensions.dart';
import 'package:orderlens/core/theming/colors_manager.dart';
import 'package:orderlens/core/theming/styles.dart';
import 'package:orderlens/core/widgets/custom_app_bar_widget.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Graph'.hardcoded,
      ),
      body: Center(
        child: Text(
          'Graph Placeholder'.hardcoded,
          style: TextStyles.font28SemiBold.copyWith(color: ColorsManager.white),
        ),
      ),
    );
  }
}
