import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/feature/splash/bloc/splash_bloc.dart';
import 'package:movie_app/feature/splash/bloc/splash_state.dart';
import 'package:movie_app/feature/wellcome/wellcome_screen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status == SplashStatus.success) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const WellComeScreen()),
              (route) => true);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/ic_logo.svg',
                height: 100,
                width: 100,
                fit: BoxFit.none,
              ),
              const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
