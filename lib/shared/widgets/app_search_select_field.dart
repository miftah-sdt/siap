import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siap/core/models/select_option.dart';
import 'package:siap/core/theme/app_spacing.dart';

class AppSearchSelectField extends FormField<String> {
  AppSearchSelectField({
    super.key,
    required String label,
    required Future<List<SelectOption>> Function(String query) onSearch,
    required ValueChanged<SelectOption?> onChanged,
    SelectOption? value,
    String hint = 'Cari dan pilih...',
    IconData? prefixIcon,
    bool enabled = true,
    bool isLoading = false,
    super.validator,
  }) : super(
         initialValue: value?.id,
         builder: (field) {
           return _SearchSelectBody(
             label: label,
             hint: hint,
             prefixIcon: prefixIcon,
             enabled: enabled && !isLoading,
             isLoading: isLoading,
             errorText: field.errorText,
             value: value,
             onSearch: onSearch,
             onChanged: (option) {
               field.didChange(option?.id);
               onChanged(option);
             },
           );
         },
       );
}

class _SearchSelectBody extends StatelessWidget {
  const _SearchSelectBody({
    required this.label,
    required this.hint,
    required this.enabled,
    required this.isLoading,
    required this.value,
    required this.onSearch,
    required this.onChanged,
    this.prefixIcon,
    this.errorText,
  });

  final String label;
  final String hint;
  final IconData? prefixIcon;
  final bool enabled;
  final bool isLoading;
  final String? errorText;
  final SelectOption? value;
  final Future<List<SelectOption>> Function(String query) onSearch;
  final ValueChanged<SelectOption?> onChanged;

  Future<void> _openPicker(BuildContext context) async {
    final selected = await showModalBottomSheet<SelectOption>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) =>
          _SearchSelectSheet(title: label, initial: value, onSearch: onSearch),
    );
    if (selected != null) {
      onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => _openPicker(context) : null,
      child: InputDecorator(
        isEmpty: value == null,
        decoration: InputDecoration(
          labelText: label,
          hintText: isLoading ? 'Memuat...' : hint,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : const Icon(Icons.search),
          errorText: errorText,
          enabled: enabled,
        ),
        child: value == null
            ? Text(
                isLoading ? 'Memuat...' : hint,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value!.label, overflow: TextOverflow.ellipsis),
                  if (value!.subtitle != null)
                    Text(
                      value!.subtitle!,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
      ),
    );
  }
}

class _SearchSelectSheet extends StatefulWidget {
  const _SearchSelectSheet({
    required this.title,
    required this.onSearch,
    this.initial,
  });

  final String title;
  final SelectOption? initial;
  final Future<List<SelectOption>> Function(String query) onSearch;

  @override
  State<_SearchSelectSheet> createState() => _SearchSelectSheetState();
}

class _SearchSelectSheetState extends State<_SearchSelectSheet> {
  final _controller = TextEditingController();
  Timer? _debounce;
  List<SelectOption> _options = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _runSearch('');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      _runSearch(query);
    });
  }

  Future<void> _runSearch(String query) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final results = await widget.onSearch(query.trim());
      if (!mounted) return;
      final selected = widget.initial;
      final merged = [...results];
      if (selected != null && !merged.any((o) => o.id == selected.id)) {
        merged.insert(0, selected);
      }
      setState(() {
        _options = merged;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.75;
    return SizedBox(
      height: height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Ketik nama, NIK, atau kode…',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _onQueryChanged,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (_loading) const LinearProgressIndicator(minHeight: 2),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          Expanded(
            child: _options.isEmpty && !_loading
                ? const Center(child: Text('Data tidak ditemukan.'))
                : ListView.separated(
                    itemCount: _options.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final option = _options[index];
                      final selected = widget.initial?.id == option.id;
                      return ListTile(
                        title: Text(option.label),
                        subtitle: option.subtitle != null
                            ? Text(option.subtitle!)
                            : null,
                        trailing: selected ? const Icon(Icons.check) : null,
                        onTap: () => Navigator.pop(context, option),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
