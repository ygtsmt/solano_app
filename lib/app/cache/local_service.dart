/* 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solano_app/app/cache/cache_client.dart';

/// The `SplashLocaleService` class is an abstract interface in Dart that defines a method to fetch user
/// data using a token asynchronously.
abstract interface class LocalService {
  Future<void> addUser(
    String token,
  );
  Future<String?> getUser();
  Future<void> logOut();
  Future<bool> isFirstLogin();
  Future<void> setFirstLogin();
}

class LocaleServiceImpl implements LocalService {
  LocaleServiceImpl(
      {required CacheClient cacheClient, required SharedPreferences storage})
      : _storage = storage,
        _cacheClient = cacheClient;
  final CacheClient _cacheClient;
  final SharedPreferences _storage;

  @override
  Future<void> addUser(String token) async {
    await _storage.setString('token', token);
    // await _cacheClient.put(_cacheClient.boxName, user);
  }

  @override
  Future<String?> getUser() async {
    return _storage.getString('token');
  }

  @override
  Future<void> logOut() async {
    await _storage.remove('token');
  }

  @override
  Future<bool> isFirstLogin() async {
    final result = _storage.getBool('firstLogin');
    if (result == null || result != true) {
      await setFirstLogin();
      return false;
    }
    return true;
  }

  @override
  Future<void> setFirstLogin() async {
    await _storage.setBool('firstLogin', true);
  }
}
 */