import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/core/utils/responsive.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:siap/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:siap/features/dashboard/presentation/widgets/chart_section.dart';
import 'package:siap/features/dashboard/presentation/widgets/summary_card.dart';
import 'package:siap/shared/widgets/app_error_view.dart';
import 'package:siap/shared/widgets/app_loading_indicator.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () =>
              const AppLoadingIndicator(message: 'Memuat dashboard...'),
          loading: () =>
              const AppLoadingIndicator(message: 'Memuat dashboard...'),
          error: (message) => AppErrorView(
            message: message,
            onRetry: () => context.read<DashboardBloc>().add(
              const DashboardEvent.started(),
            ),
          ),
          success: (summary, charts) => RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardBloc>().add(
                const DashboardEvent.refreshed(),
              );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  GridView.count(
                    crossAxisCount: Responsive.value(
                      context: context,
                      mobile: 2,
                      tablet: 2,
                      desktop: 4,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: AppSpacing.md,
                    crossAxisSpacing: AppSpacing.md,
                    childAspectRatio: Responsive.value(
                      context: context,
                      mobile: 1.3,
                      tablet: 1.5,
                      desktop: 1.6,
                    ),
                    children: [
                      SummaryCard(
                        title: 'Total Petani',
                        value: Formatter.decimal(summary.totalPetani),
                        icon: Icons.people_outline,
                        color: Colors.green,
                      ),
                      SummaryCard(
                        title: 'Total Lahan',
                        value: Formatter.decimal(summary.totalLahan),
                        icon: Icons.landscape_outlined,
                        color: Colors.brown,
                      ),
                      SummaryCard(
                        title: 'Total Polis',
                        value: Formatter.decimal(summary.totalPolis),
                        icon: Icons.description_outlined,
                        color: Colors.blue,
                      ),
                      SummaryCard(
                        title: 'Total Klaim',
                        value: Formatter.decimal(summary.totalKlaim),
                        icon: Icons.report_outlined,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Responsive.value(
                    context: context,
                    mobile: Column(
                      children: [
                        ChartSection(
                          title: 'Registrasi Bulanan',
                          points: charts.monthlyRegistrations,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        ChartSection(
                          title: 'Klaim Bulanan',
                          points: charts.monthlyClaims,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                    desktop: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ChartSection(
                            title: 'Registrasi Bulanan',
                            points: charts.monthlyRegistrations,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: ChartSection(
                            title: 'Klaim Bulanan',
                            points: charts.monthlyClaims,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          orElse: () =>
              const AppLoadingIndicator(message: 'Memuat dashboard...'),
        );
      },
    );
  }
}
