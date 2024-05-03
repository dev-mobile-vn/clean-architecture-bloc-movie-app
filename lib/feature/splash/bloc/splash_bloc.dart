import 'package:bloc/bloc.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<GetScreenWellCome>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3), () {
        emit(state.copyWith(status: SplashStatus.success));
      });
    });
  }
}
