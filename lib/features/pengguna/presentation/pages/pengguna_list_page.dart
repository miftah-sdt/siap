import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_bloc.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_event.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_list_state.dart';
import 'package:siap/features/pengguna/presentation/widgets/pengguna_card.dart';
import 'package:siap/features/pengguna/presentation/widgets/pengguna_search_bar.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_empty_state.dart';
import 'package:siap/shared/widgets/app_error_view.dart';
import 'package:siap/shared/widgets/app_loading_indicator.dart';

class PenggunaListPage extends StatefulWidget {
  const PenggunaListPage({super.key});

  @override
  State<PenggunaListPage> createState() => _PenggunaListPageState();
}

class _PenggunaListPageState extends State<PenggunaListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PenggunaListBloc>().add(const PenggunaListEvent.started());
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
      context.read<PenggunaListBloc>().add(const PenggunaListEvent.loadMore());
    }
  }

  void _search() {
    context.read<PenggunaListBloc>().add(
      PenggunaListEvent.searched(_searchController.text),
    );
  }

  Future<void> _confirmDelete(String id, String name) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Pengguna'),
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
      context.read<PenggunaListBloc>().add(PenggunaListEvent.deleted(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(RouteNames.penggunaCreate),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: BlocConsumer<PenggunaListBloc, PenggunaListState>(
        listener: (context, state) {
          if (state is PenggunaListError) {
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
                'Data Pengguna',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              PenggunaSearchBar(
                controller: _searchController,
                onSearch: _search,
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: state.maybeWhen(
                  initial: () => const AppLoadingIndicator(
                    message: 'Memuat data pengguna...',
                  ),
                  loading: () => const AppLoadingIndicator(
                    message: 'Memuat data pengguna...',
                  ),
                  error: (message) => AppErrorView(
                    message: message,
                    onRetry: () => context.read<PenggunaListBloc>().add(
                      const PenggunaListEvent.started(),
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
                            title: 'Belum ada pengguna',
                            message: 'Tambahkan data pengguna pertama.',
                            actionLabel: 'Tambah Pengguna',
                            onAction: () =>
                                context.push(RouteNames.penggunaCreate),
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<PenggunaListBloc>().add(
                              const PenggunaListEvent.refreshed(),
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
                              final pengguna = items[index];
                              return PenggunaCard(
                                pengguna: pengguna,
                                onTap: () => context.push(
                                  RouteNames.penggunaDetail(pengguna.id),
                                  extra: pengguna,
                                ),
                                onDelete: () =>
                                    _confirmDelete(pengguna.id, pengguna.name),
                              );
                            },
                          ),
                        );
                      },
                  orElse: () => const AppLoadingIndicator(
                    message: 'Memuat data pengguna...',
                  ),
                ),
              ),
              if (state is PenggunaListSuccess)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    'Total: ${state.total} pengguna',
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
