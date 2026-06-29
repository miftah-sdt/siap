import 'package:flutter/material.dart';
import 'package:siap/core/models/select_option.dart';

class AppSelectField extends StatelessWidget {
  const AppSelectField({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
    this.hint = 'Pilih...',
    this.prefixIcon,
    this.enabled = true,
    this.validator,
    this.isLoading = false,
  });

  final String label;
  final List<SelectOption> options;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String hint;
  final IconData? prefixIcon;
  final bool enabled;
  final String? Function(String?)? validator;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: options.any((o) => o.id == value) ? value : null,
      decoration: InputDecoration(
        labelText: label,
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
            : null,
      ),
      hint: Text(isLoading ? 'Memuat...' : hint),
      isExpanded: true,
      selectedItemBuilder: (context) => options
          .map(
            (option) => Align(
              alignment: Alignment.centerLeft,
              child: Text(option.label, overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      items: options
          .map(
            (option) => DropdownMenuItem<String>(
              value: option.id,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(option.label, overflow: TextOverflow.ellipsis),
                  if (option.subtitle != null)
                    Text(
                      option.subtitle!,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: enabled && !isLoading ? onChanged : null,
      validator: validator,
    );
  }
}
