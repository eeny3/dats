import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_app_links/flutter_facebook_app_links.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dats/routing/app_router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    catchFBDeferredDeeplinks();
    initPlatformState();
  }

  void catchFBDeferredDeeplinks() async {
    try {
      Map<String, String>? data = await FlutterFacebookAppLinks.initFBLinks();

      if (data != null && data['deeplink'] != null) {
        if (data['deeplink']!.isNotEmpty) {
          /// do stuffs with the deeplink
        }
      }
    } catch (e) {
      print('Error on FB APP LINKS');
    }
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await FlutterFacebookAppLinks.platformVersion ?? 'Unknown';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (context, child) {
        return MaterialApp.router(
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
        );
      },
    );
  }
}
