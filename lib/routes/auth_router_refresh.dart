import 'package:flutter/foundation.dart';

/// Memicu GoRouter re-evaluate redirect setelah login/logout.
class AuthRouterRefresh extends ChangeNotifier {
  void notifyAuthChanged() => notifyListeners();
}
