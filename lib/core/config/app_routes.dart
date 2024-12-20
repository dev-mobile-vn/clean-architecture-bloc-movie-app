import 'package:movie_app/di/dependency_injection.dart';
import 'package:movie_app/features/auth/forgot_pass_word/forgot_pass_word_screen.dart';
import 'package:movie_app/features/auth/login/login_screen.dart';
import 'package:movie_app/features/auth/sign_up/sign_up_screen.dart';
import 'package:movie_app/features/comments/post_comment_screen.dart';
import 'package:movie_app/features/main/bloc/main_bloc.dart';
import 'package:movie_app/features/main/screens/main_screen.dart';
import 'package:movie_app/features/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/features/movies/presentation/bloc/list_movie_cubit.dart';
import 'package:movie_app/features/movies/presentation/screen/list_movie_screen.dart';
import 'package:movie_app/features/splash/splash_screen.dart';
import 'package:movie_app/features/watch_video/watch_video_screen.dart';
import 'package:movie_app/features/wellcome/bloc/well_come_bloc.dart';
import 'package:movie_app/features/wellcome/wellcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/contants/routers.dart';

class AppRouters {
  final MainBloc mainBloc = MainBloc();
  final WellComeBloc wellComeBloc = WellComeBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case welComeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<WellComeBloc>.value(
                  value: wellComeBloc,
                  child: const WellComeScreen(),
                ));
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case forgotPassRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPassWordScreen(),
        );
      case movieDetailRoute:
        return MaterialPageRoute(
          builder: (_) => MovieDetailScreen(
            id: args as String,
          ),
        );
      case listMovieRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl.get<ListMovieCubit>(),
            child: ListMovieScreen(path: args as String),
          ),
        );
      case watchVideoRoute:
        return MaterialPageRoute(
          builder: (_) => WatchVideoScreen(
            arguments: args as WatchVideoArguments,
          ),
        );
      case postCommentRoute:
        return MaterialPageRoute(
          builder: (_) => PostCommentsScreen(
            id: args as String,
          ),
        );
      case mainRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MainBloc>.value(
            value: mainBloc,
            child: const MainScreen(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
