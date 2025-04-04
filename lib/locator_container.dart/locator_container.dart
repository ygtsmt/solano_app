import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:solano_app/app/cache/cache_client.dart';
import 'package:solano_app/features/splash/cubit/splash_cubit.dart';

/// [Locator] is responsible for locating and registering all the
/// services of the application.
abstract final class Locator {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  /// Returns instance of [SplashCubit]
   static SplashCubit get splashCubit => _instance<SplashCubit>();

  /// Responsible for registering all the dependencies
  static Future<void> locateServices({required String baseUrl}) async {
    // core
    _instance

      // cubit
      ..registerFactory(() => SplashCubit());

    // Snackbar Service
    // ..registerLazySingleton<SnackbarService>(
    //     () => SnackbarServiceImpl(scaffoldMessengerKey))

    // // Client Dependencies

    // ..registerLazySingleton(
    //     () => NetworkClient(dio: _instance(), baseUrl: baseUrl))
    // ..registerFactory(Dio.new)
    // ..registerLazySingleton<FlutterSecureStorage>(
    //   FlutterSecureStorage.new,
    // );

    // Initialize Clients
  //  await _instance<CacheClient>().init();
  }
}
