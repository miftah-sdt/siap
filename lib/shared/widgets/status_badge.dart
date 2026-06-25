import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  factory StatusBadge.draft(String label) =>
      StatusBadge(label: label, color: Colors.grey);

  factory StatusBadge.pending(String label) =>
      StatusBadge(label: label, color: Colors.orange);

  factory StatusBadge.success(String label) =>
      StatusBadge(label: label, color: Colors.green);

  factory StatusBadge.error(String label) =>
      StatusBadge(label: label, color: Colors.red);

  factory StatusBadge.info(String label) =>
      StatusBadge(label: label, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
