import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/auth/role_context.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_bloc.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_event.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_list_state.dart';
import 'package:siap/features/klaim/presentation/widgets/klaim_card.dart';
import 'package:siap/features/petani/presentation/widgets/petani_search_bar.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_empty_state.dart';
import 'package:siap/shared/widgets/app_error_view.dart';
import 'package:siap/shared/widgets/app_loading_indicator.dart';
import 'package:siap/shared/widgets/permission_fab.dart';

class KlaimListPage extends StatefulWidget {
  const KlaimListPage({super.key});

  @override
  State<KlaimListPage> createState() => _KlaimListPageState();
}

class _KlaimListPageState extends State<KlaimListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<KlaimListBloc>().add(const KlaimListEvent.started());
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
      context.read<KlaimListBloc>().add(const KlaimListEvent.loadMore());
    }
  }

  void _search() {
    context.read<KlaimListBloc>().add(
      KlaimListEvent.searched(_searchController.text),
    );
  }

  Future<void> _confirmDelete(String id, String nomorKlaim) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Klaim'),
        content: Text('Yakin ingin menghapus klaim $nomorKlaim?'),
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
      context.read<KlaimListBloc>().add(KlaimListEvent.deleted(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final role = context.userRole;
    final canCreate = AppPermissions.can(
      role,
      AppModule.klaim,
      PermissionAction.create,
    );
    final canDelete = AppPermissions.can(
      role,
      AppModule.klaim,
      PermissionAction.delete,
    );

    return Scaffold(
      floatingActionButton: PermissionFab(
        module: AppModule.klaim,
        onPressed: () => context.push(RouteNames.klaimCreate),
      ),
      body: BlocConsumer<KlaimListBloc, KlaimListState>(
        listener: (context, state) {
          if (state is KlaimListError) {
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
                'Data Klaim',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              PetaniSearchBar(controller: _searchController, onSearch: _search),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: state.maybeWhen(
                  initial: () => const AppLoadingIndicator(
                    message: 'Memuat data klaim...',
                  ),
                  loading: () => const AppLoadingIndicator(
                    message: 'Memuat data klaim...',
                  ),
                  error: (message) => AppErrorView(
                    message: message,
                    onRetry: () => context.read<KlaimListBloc>().add(
                      const KlaimListEvent.started(),
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
                            title: 'Belum ada klaim',
                            message: 'Ajukan klaim pertama.',
                            actionLabel: canCreate ? 'Tambah Klaim' : null,
                            onAction: canCreate
                                ? () => context.push(RouteNames.klaimCreate)
                                : null,
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<KlaimListBloc>().add(
                              const KlaimListEvent.refreshed(),
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
                              final klaim = items[index];
                              return KlaimCard(
                                klaim: klaim,
                                onTap: () => context.push(
                                  RouteNames.klaimDetail(klaim.id),
                                  extra: klaim,
                                ),
                                onDelete: canDelete
                                    ? () => _confirmDelete(
                                        klaim.id,
                                        klaim.nomorKlaim,
                                      )
                                    : null,
                              );
                            },
                          ),
                        );
                      },
                  orElse: () => const AppLoadingIndicator(
                    message: 'Memuat data klaim...',
                  ),
                ),
              ),
              if (state is KlaimListSuccess)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    'Total: ${state.total} klaim',
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
