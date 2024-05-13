import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/contants/language_code.dart';
import 'common/contants/routers.dart';
import 'common/resource/theme.dart';
import 'config/app_routes.dart';
import 'di/dependency_injection.dart';
import 'features/main/screens/explore/presentation/bloc/explore_cubit.dart';
import 'features/main/screens/home/bloc/home_cubit.dart';
import 'generated/l10n.dart';

const koHoFontFamily = 'koHo';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    if (Platform.localeName == LanguageName.vn) {
      _locale = LanguageLocale.vn;
    } else {
      _locale = LanguageLocale.en;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
           BlocProvider<HomeCubit>.value(value: sl<HomeCubit>()),
           BlocProvider<ExploreCubit>.value(value: sl<ExploreCubit>()),
        ],
        child: MaterialApp(
          initialRoute: splashRoute,
          onGenerateRoute: AppRouters().generateRoute,
          title: 'App',
          debugShowCheckedModeBanner: false,
          theme: themeData(context),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            LanguageLocale.vn,
            LanguageLocale.en,
          ],
          locale: _locale,
        ));
  }
}
