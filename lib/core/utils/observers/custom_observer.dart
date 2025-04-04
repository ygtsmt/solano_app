import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solano_app/core/utils/logger/logger_utils.dart';
import 'package:solano_app/features/splash/cubit/splash_cubit.dart';

/// Custom BlocObserver to log Bloc events
final class CustomBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerUtils.instance.logError('${bloc.runtimeType} $error');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    // if (bloc is SplashCubit) {
    //   bloc.splashInit();
    //   print('objectobjectobject');
    // }
    // if (bloc is HomeCubit) {
    //   bloc.initializePsychologistList();
    // }
    // if (bloc is PersonalTestCubit) {
    //   bloc.getPersonalTests();
    // }

    LoggerUtils.instance.logInfo('Created: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    LoggerUtils.instance.logInfo('Closed: ${bloc.runtimeType}');
  }
}
