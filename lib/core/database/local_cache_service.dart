import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

/// Local key-value cache for offline reads (Hive).
class LocalCacheService {
  static const _boxName = 'siap_cache';

  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<String>(_boxName);
    }
  }

  Box<String> get _box => Hive.box<String>(_boxName);

  Future<void> putJson(String key, Map<String, dynamic> value) async {
    await _box.put(key, jsonEncode(value));
  }

  Map<String, dynamic>? getJson(String key) {
    final raw = _box.get(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> remove(String key) => _box.delete(key);

  Future<void> clear() => _box.clear();
}
