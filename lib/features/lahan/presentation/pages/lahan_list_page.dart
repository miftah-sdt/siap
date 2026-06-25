import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_bloc.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_event.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_list_state.dart';
import 'package:siap/features/lahan/presentation/widgets/lahan_card.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_empty_state.dart';
import 'package:siap/shared/widgets/app_error_view.dart';
import 'package:siap/shared/widgets/app_loading_indicator.dart';

class LahanListPage extends StatefulWidget {
  const LahanListPage({super.key});

  @override
  State<LahanListPage> createState() => _LahanListPageState();
}

class _LahanListPageState extends State<LahanListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<LahanListBloc>().add(const LahanListEvent.started());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<LahanListBloc>().add(const LahanListEvent.loadMore());
    }
  }

  void _search() {
    context.read<LahanListBloc>().add(
      LahanListEvent.searched(_searchController.text),
    );
  }

  Future<void> _confirmDelete(String id, String name) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Lahan'),
        content: Text('Yakin ingin menghapus $name?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      context.read<LahanListBloc>().add(LahanListEvent.deleted(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(RouteNames.lahanCreate),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: BlocConsumer<LahanListBloc, LahanListState>(
        listener: (context, state) {
          if (state is LahanListError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Data Lahan',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Cari lahan...',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onSubmitted: (_) => _search(),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  IconButton.filled(
                    onPressed: _search,
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: state.maybeWhen(
                  initial: () => const AppLoadingIndicator(
                    message: 'Memuat data lahan...',
                  ),
                  loading: () => const AppLoadingIndicator(
                    message: 'Memuat data lahan...',
                  ),
                  error: (message) => AppErrorView(
                    message: message,
                    onRetry: () => context.read<LahanListBloc>().add(
                      const LahanListEvent.started(),
                    ),
                  ),
                  success:
                      (
                        items,
                        page,
                        totalPages,
                        total,
                        searchQuery,
                        isLoadingMore,
                        hasReachedMax,
                      ) {
                        if (items.isEmpty) {
                          return AppEmptyState(
                            title: 'Belum ada lahan',
                            message: 'Tambahkan data lahan pertama.',
                            actionLabel: 'Tambah Lahan',
                            onAction: () =>
                                context.push(RouteNames.lahanCreate),
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<LahanListBloc>().add(
                              const LahanListEvent.refreshed(),
                            );
                          },
                          child: ListView.separated(
                            controller: _scrollController,
                            itemCount: items.length + (isLoadingMore ? 1 : 0),
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: AppSpacing.sm),
                            itemBuilder: (context, index) {
                              if (index >= items.length) {
                                return const Padding(
                                  padding: EdgeInsets.all(AppSpacing.md),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final lahan = items[index];
                              return LahanCard(
                                lahan: lahan,
                                onTap: () => context.push(
                                  RouteNames.lahanDetail(lahan.id),
                                  extra: lahan,
                                ),
                                onDelete: () =>
                                    _confirmDelete(lahan.id, lahan.namaLahan),
                              );
                            },
                          ),
                        );
                      },
                  orElse: () => const AppLoadingIndicator(
                    message: 'Memuat data lahan...',
                  ),
                ),
              ),
              if (state is LahanListSuccess)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    'Total: ${state.total} lahan',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
