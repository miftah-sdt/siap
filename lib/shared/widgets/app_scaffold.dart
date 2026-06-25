import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/responsive.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.drawer,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      drawer: isDesktop ? null : drawer,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.value(
              context: context,
              mobile: AppSpacing.md,
              tablet: AppSpacing.lg,
              desktop: AppSpacing.xl,
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}
