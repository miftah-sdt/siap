import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';

class PenggunaSearchBar extends StatelessWidget {
  const PenggunaSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Cari pengguna...',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (_) => onSearch(),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        IconButton.filled(onPressed: onSearch, icon: const Icon(Icons.search)),
      ],
    );
  }
}
