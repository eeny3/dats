// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StartupPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MainPage(
          key: args.key,
          onData: args.onData,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
      ];
}

/// generated route for
/// [StartupPage]
class StartupRoute extends PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    required Map<dynamic, dynamic>? onData,
  }) : super(
          MainRoute.name,
          path: '/main-page',
          args: MainRouteArgs(
            key: key,
            onData: onData,
          ),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.onData,
  });

  final Key? key;

  final Map<dynamic, dynamic>? onData;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, onData: $onData}';
  }
}
