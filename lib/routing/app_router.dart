import 'package:auto_route/auto_route.dart';
import 'package:dats/pages/startup_page/startup_page.dart';
import 'package:flutter/material.dart';
import 'package:dats/pages/main_page/main_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: StartupPage,
    ),
    AutoRoute(
      page: MainPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}