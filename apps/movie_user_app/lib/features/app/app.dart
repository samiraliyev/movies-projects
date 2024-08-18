
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_theme/app_theme.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ui_components/ui_components.dart';

import '../../core/theme/app_theme_data.dart';
import '../../injection/riverpod/notifiers.dart';
import '../../injection/services/injection_container.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.read(authNotifierProvider.notifier).getInitAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.read(appRouterProvider).router;

    // ref.listen<AuthState>(
    //   authNotifierProvider,
    //   (previous, next) {
    //     if (next != previous) {
    //       if (next is GoSplash) {
    //         appRouter.push(AppRoutes.splash);
    //       } else if (next is UnAuthenticated) {
    //         sendDeviceReset();
    //         appRouter.go(AppRoutes.getStarted);
    //       } else if (next is Authenticated) {
    //         if (next.goSplash) {
    //           ref.read(navbarNotifierProvider.notifier).changeTab(0);
    //           ref.read(homeDeviceListNotifierProvider.notifier).getDataList();
    //           appRouter.go(AppRoutes.home);
    //         }
    //       } else if (next is NetworkError) {
    //         appRouter.go(AppRoutes.splash);
    //       } else {
    //         appRouter.go(AppRoutes.splash);
    //       }
    //     }
    //   },
    // );
    final themeState = ref.watch(themeNotifierProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init(constraints, orientation);

            return AppThemeProvider(
              appTheme: AppTheme(
                // userColorType: state.user.userType != null
                colors: themeState == ThemeMode.dark
                    ? AppColorsData.dark()
                    : AppColorsData.light(),
                typography: AppTypographyData.regular(),
              ),
              child: Builder(
                builder: (BuildContext context) {
                  return KeyboardDismisser(
                    child: MaterialApp.router(
                      themeMode: themeState,
                      key: widget.key,
                      title: 'User App',
                      debugShowCheckedModeBanner: false,
                      locale: Locale(
                        ref
                            .watch(localizationNotifierProvider)
                            .locale
                            .languageCode,
                      ),
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      routerDelegate: appRouter.routerDelegate,
                      routeInformationParser: appRouter.routeInformationParser,
                      routeInformationProvider:
                          appRouter.routeInformationProvider,
                      theme: themeState == ThemeMode.dark
                          ? AppThemeData.dark(
                              context.theme.colors,
                              context.theme.typography,
                            )
                          : AppThemeData.light(
                              context.theme.colors,
                              context.theme.typography,
                            ),
                      builder: (context, child) {
                        // ScreenProtectUtils.protectDataLeakage();

                        return PageWrapper(child: child!);
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class PageWrapper extends ConsumerWidget {
  const PageWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaData = MediaQuery.of(context);

    return MediaQuery(
      data: mediaData.copyWith(
        textScaler: mediaData.textScaler
            .clamp(minScaleFactor: 1.0, maxScaleFactor: 1.3),
      ),
      child: CustomScrollConfiguration(
        child: child,
      ),
      // child: CustomScrollConfiguration(
      //   child: child,
      // ),
    );
  }
}
