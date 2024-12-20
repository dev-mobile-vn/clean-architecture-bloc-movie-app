import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/common/contants/language_code.dart';
import 'core/common/contants/routers.dart';
import 'core/common/resource/theme.dart';
import 'core/common/translations/l10n.dart';
import 'core/config/app_config.dart';
import 'core/config/app_routes.dart';
import 'di/dependency_injection.dart';
import 'features/main/screens/explore/presentation/bloc/explore_cubit.dart';
import 'features/main/screens/home/bloc/home_cubit.dart';

const koHoFontFamily = 'koHo';


void main() async {
  await appConfig();
  runApp(const App());
}

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
          title: 'Movie',
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


