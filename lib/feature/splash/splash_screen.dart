import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/splash/bloc/splash_event.dart';
import 'package:movie_app/feature/splash/splash_view.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(GetScreenWellCome()),
      child: const SplashView(),
    );
  }
}
