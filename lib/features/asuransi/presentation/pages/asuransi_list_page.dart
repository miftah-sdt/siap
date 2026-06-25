import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_bloc.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_event.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_list_state.dart';
import 'package:siap/features/asuransi/presentation/widgets/asuransi_card.dart';
import 'package:siap/features/petani/presentation/widgets/petani_search_bar.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_empty_state.dart';
import 'package:siap/shared/widgets/app_error_view.dart';
import 'package:siap/shared/widgets/app_loading_indicator.dart';

class AsuransiListPage extends StatefulWidget {
  const AsuransiListPage({super.key});

  @override
  State<AsuransiListPage> createState() => _AsuransiListPageState();
}

class _AsuransiListPageState extends State<AsuransiListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AsuransiListBloc>().add(const AsuransiListEvent.started());
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
      context.read<AsuransiListBloc>().add(const AsuransiListEvent.loadMore());
    }
  }

  void _search() {
    context.read<AsuransiListBloc>().add(
      AsuransiListEvent.searched(_searchController.text),
    );
  }

  Future<void> _confirmDelete(String id, String nomorPolis) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Asuransi'),
        content: Text('Yakin ingin menghapus polis $nomorPolis?'),
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
      context.read<AsuransiListBloc>().add(AsuransiListEvent.deleted(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(RouteNames.asuransiCreate),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: BlocConsumer<AsuransiListBloc, AsuransiListState>(
        listener: (context, state) {
          if (state is AsuransiListError) {
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
                'Data Asuransi',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              PetaniSearchBar(controller: _searchController, onSearch: _search),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: state.maybeWhen(
                  initial: () => const AppLoadingIndicator(
                    message: 'Memuat data asuransi...',
                  ),
                  loading: () => const AppLoadingIndicator(
                    message: 'Memuat data asuransi...',
                  ),
                  error: (message) => AppErrorView(
                    message: message,
                    onRetry: () => context.read<AsuransiListBloc>().add(
                      const AsuransiListEvent.started(),
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
                            title: 'Belum ada asuransi',
                            message: 'Daftarkan asuransi pertama.',
                            actionLabel: 'Tambah Asuransi',
                            onAction: () =>
                                context.push(RouteNames.asuransiCreate),
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<AsuransiListBloc>().add(
                              const AsuransiListEvent.refreshed(),
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
                              final asuransi = items[index];
                              return AsuransiCard(
                                asuransi: asuransi,
                                onTap: () => context.push(
                                  RouteNames.asuransiDetail(asuransi.id),
                                  extra: asuransi,
                                ),
                                onDelete: () => _confirmDelete(
                                  asuransi.id,
                                  asuransi.nomorPolis,
                                ),
                              );
                            },
                          ),
                        );
                      },
                  orElse: () => const AppLoadingIndicator(
                    message: 'Memuat data asuransi...',
                  ),
                ),
              ),
              if (state is AsuransiListSuccess)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    'Total: ${state.total} asuransi',
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
