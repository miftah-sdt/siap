import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Reloads a page when it becomes the active route again.
///
/// Covers:
/// - returning from a full-screen child (create/detail/edit on the root navigator)
/// - browser back on web (GoRouter often drops `push` results)
/// - returning from another browser tab / app resume
class RouteVisibilityReloader extends StatefulWidget {
  const RouteVisibilityReloader({
    super.key,
    required this.location,
    required this.onBecameVisible,
    required this.child,
  });

  /// Exact path of this page, e.g. `/asuransi` — not `/asuransi/create`.
  final String location;
  final VoidCallback onBecameVisible;
  final Widget child;

  @override
  State<RouteVisibilityReloader> createState() =>
      _RouteVisibilityReloaderState();
}

class _RouteVisibilityReloaderState extends State<RouteVisibilityReloader>
    with WidgetsBindingObserver {
  GoRouter? _router;
  String? _previousPath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.of(context);
    if (identical(_router, router)) return;
    _router?.routerDelegate.removeListener(_onRouteChanged);
    _router = router;
    _previousPath = _currentPath();
    _router!.routerDelegate.addListener(_onRouteChanged);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _isThisPage(_currentPath())) {
      widget.onBecameVisible();
    }
  }

  String _currentPath() {
    final raw =
        _router?.state.matchedLocation ??
        GoRouterState.of(context).matchedLocation;
    return _normalize(raw);
  }

  bool _isThisPage(String path) => path == _normalize(widget.location);

  void _onRouteChanged() {
    if (!mounted) return;
    final path = _currentPath();
    final wasAway = _previousPath != null && !_isThisPage(_previousPath!);
    _previousPath = path;
    if (wasAway && _isThisPage(path)) {
      widget.onBecameVisible();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _router?.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

String _normalize(String path) {
  if (path.length > 1 && path.endsWith('/')) {
    return path.substring(0, path.length - 1);
  }
  return path;
}
