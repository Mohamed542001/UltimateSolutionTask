import 'package:responsive_framework/responsive_framework.dart';

import 'app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LocalizationBloc>(
                  create: (context) => getIt<LocalizationBloc>()),
            ],
            child: BlocBuilder<LocalizationBloc, LocalizationState>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, localeState) {
                return MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalization.supportedLocales,
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null &&
                          deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  locale: localeState.locale,
                  title: 'Ultimate Solution Task',
                  restorationScopeId: 'app',
                  debugShowCheckedModeBanner: false,
                  theme: AppThemes.lightTheme,
                  onGenerateRoute: AppRouter.generateRoutes,
                  builder: (context, child) => ResponsiveBreakpoints.builder(
                    child: child!,
                    breakpoints: [
                      const Breakpoint(start: 350, end: 700, name: MOBILE),
                      const Breakpoint(start: 701, end: 950, name: TABLET),
                      const Breakpoint(start: 951, end: 1500, name: DESKTOP),
                      const Breakpoint(
                          start: 1501, end: double.infinity, name: '4K'),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
