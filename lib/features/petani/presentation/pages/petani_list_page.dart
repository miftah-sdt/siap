import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/auth/app_permissions.dart';
import 'package:siap/core/auth/role_context.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_bloc.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_event.dart';
import 'package:siap/features/petani/presentation/bloc/petani_list_state.dart';
import 'package:siap/features/petani/presentation/widgets/petani_card.dart';
import 'package:siap/features/petani/presentation/widgets/petani_search_bar.dart';
import 'package:siap/routes/route_names.dart';
import 'package:siap/shared/widgets/app_empty_state.dart';
import 'package:siap/shared/widgets/permission_fab.dart';
import 'package:siap/shared/widgets/app_error_view.dart';
import 'package:siap/shared/widgets/app_loading_indicator.dart';

class PetaniListPage extends StatefulWidget {
  const PetaniListPage({super.key});

  @override
  State<PetaniListPage> createState() => _PetaniListPageState();
}

class _PetaniListPageState extends State<PetaniListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PetaniListBloc>().add(const PetaniListEvent.started());
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
      context.read<PetaniListBloc>().add(const PetaniListEvent.loadMore());
    }
  }

  void _search() {
    context.read<PetaniListBloc>().add(
      PetaniListEvent.searched(_searchController.text),
    );
  }

  Future<void> _confirmDelete(String id, String name) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Petani'),
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
      context.read<PetaniListBloc>().add(PetaniListEvent.deleted(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final role = context.userRole;
    final canCreate = AppPermissions.can(
      role,
      AppModule.petani,
      PermissionAction.create,
    );
    final canDelete = AppPermissions.can(
      role,
      AppModule.petani,
      PermissionAction.delete,
    );

    return Scaffold(
      floatingActionButton: PermissionFab(
        module: AppModule.petani,
        onPressed: () => context.push(RouteNames.petaniCreate),
      ),
      body: BlocConsumer<PetaniListBloc, PetaniListState>(
        listener: (context, state) {
          if (state is PetaniListError) {
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
                'Data Petani',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              PetaniSearchBar(controller: _searchController, onSearch: _search),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: state.maybeWhen(
                  initial: () => const AppLoadingIndicator(
                    message: 'Memuat data petani...',
                  ),
                  loading: () => const AppLoadingIndicator(
                    message: 'Memuat data petani...',
                  ),
                  error: (message) => AppErrorView(
                    message: message,
                    onRetry: () => context.read<PetaniListBloc>().add(
                      const PetaniListEvent.started(),
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
                            title: 'Belum ada petani',
                            message: 'Tambahkan data petani pertama.',
                            actionLabel: canCreate ? 'Tambah Petani' : null,
                            onAction: canCreate
                                ? () => context.push(RouteNames.petaniCreate)
                                : null,
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<PetaniListBloc>().add(
                              const PetaniListEvent.refreshed(),
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
                              final petani = items[index];
                              return PetaniCard(
                                petani: petani,
                                onTap: () => context.push(
                                  RouteNames.petaniDetail(petani.id),
                                  extra: petani,
                                ),
                                onDelete: canDelete
                                    ? () =>
                                          _confirmDelete(petani.id, petani.nama)
                                    : null,
                              );
                            },
                          ),
                        );
                      },
                  orElse: () => const AppLoadingIndicator(
                    message: 'Memuat data petani...',
                  ),
                ),
              ),
              if (state is PetaniListSuccess)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    'Total: ${state.total} petani',
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
