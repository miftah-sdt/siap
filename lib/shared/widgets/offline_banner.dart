import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:siap/core/services/connectivity_service.dart';
import 'package:siap/injection/dependency_injection.dart';

class OfflineBanner extends StatefulWidget {
  const OfflineBanner({super.key, required this.child});

  final Widget child;

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    _check();
    sl<ConnectivityService>().onConnectivityChanged.listen((results) {
      if (!mounted) return;
      setState(() {
        _isOnline = !results.contains(ConnectivityResult.none);
      });
    });
  }

  Future<void> _check() async {
    final online = await sl<ConnectivityService>().isOnline;
    if (mounted) setState(() => _isOnline = online);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_isOnline)
          MaterialBanner(
            content: const Text(
              'Mode offline — menampilkan data cache jika tersedia.',
            ),
            leading: const Icon(Icons.cloud_off_outlined),
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            actions: [
              TextButton(onPressed: _check, child: const Text('Cek lagi')),
            ],
          ),
        Expanded(child: widget.child),
      ],
    );
  }
}
