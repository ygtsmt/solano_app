import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solano_app/app/constants/root_path_constants.dart';
import 'package:solano_app/app/router/app_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splashInit() {
    Future.delayed(Duration(seconds: 2), () {
      AppRouter.router.go(RootPathConstants.homeRoot);
    });
  }
}
