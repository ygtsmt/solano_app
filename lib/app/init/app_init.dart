import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:path_provider/path_provider.dart';
import 'package:solano_app/app/env/env.dart';
import 'package:solano_app/core/utils/observers/custom_observer.dart';
import 'package:solano_app/locator_container.dart/locator_container.dart';

/// this key is used snacbar message
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract final class AppInitializer {
  static Future<void> initialize() async {
    // Initialize Bloc Observer
    Bloc.observer = CustomBlocObserver();
    await Locator.locateServices(baseUrl: Env.baseUrl);

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
    // Set Screen Orientation
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    // Initialize Hive
    await Hive.initFlutter();
    // Initialize Locator
    // Initialize Localization
    await EasyLocalization.ensureInitialized();
  }
}
