import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';

/// A base class for all the cache clients in the app.
/// Any new cache client should extend this class by specifying the type of data it will be storing.
abstract class SecureCacheClient<T> {
  String get boxName;
  Box<T>? _box;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Initialize the secure cache client.
  Future<void> init() async {
    registerAdapters();

    // Check if the encryption key exists in secure storage.
    final encryptionKey = await _secureStorage.read(key: '$boxName-key') ??
        _generateAndStoreEncryptionKey();

    final encryptionKeyBytes = _convertKeyToUint8List(encryptionKey);

    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<T>(
        boxName,
        encryptionCipher: HiveAesCipher(encryptionKeyBytes),
      );
    }
  }

  /// Register Hive adapters for the specific data type.
  void registerAdapters();

  /// Generate and store a new encryption key in secure storage.
  String _generateAndStoreEncryptionKey() {
    final key = Hive.generateSecureKey();
    final keyString = key.join(',');
    _secureStorage.write(key: '$boxName-key', value: keyString);
    return keyString;
  }

  /// Convert the stored key string to a Uint8List.
  Uint8List _convertKeyToUint8List(String keyString) {
    final keyParts = keyString.split(',').map(int.parse).toList();
    return Uint8List.fromList(keyParts);
  }

  /// Get an item by key.
  Future<T?> get(String key) async {
    return _box?.get(key);
  }

  /// Get all items in the box.
  List<T>? getAll() {
    return _box?.values.toList();
  }

  /// Add an item to the box.
  Future<void> add(T item) async {
    await _box?.add(item);
  }

  /// Add multiple items to the box.
  Future<void> addList(List<T> items) async {
    await _box?.addAll(items);
  }

  /// Update or insert an item with a key.
  Future<void> put(String key, T item) async {
    await _box?.put(key, item);
  }

  /// Update or insert multiple items.
  Future<void> putMultiple(Map<String, T> mapObject) async {
    await _box?.putAll(mapObject);
  }

  /// Delete an item by key.
  Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  /// Delete an item at a specific index.
  Future<void> deleteAt(int index) async {
    await _box?.deleteAt(index);
  }

  /// Delete multiple items by their keys.
  Future<void> deleteMultiple(List<dynamic> keys) async {
    await _box?.deleteAll(keys);
  }

  /// Clear all items in the box.
  Future<void> deleteAll() async {
    await _box?.clear();
  }

  /// Dispose resources.
  Future<void> dispose() async {
    await _box?.close();
  }
}
