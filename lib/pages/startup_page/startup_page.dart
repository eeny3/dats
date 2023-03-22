import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:dats/pages/main_page/main_page.dart';
import 'package:dats/pages/startup_page/startup_page_store.dart';
import 'package:dats/pages/startup_page/widgets/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final StartupPageStore pageStore = StartupPageStore();
  late AppsflyerSdk _appsflyerSdk;
  Map? _deepLinkData;
  Map? _gcd;

  static initNotify() async {
    try {
      await OneSignal.shared.promptUserForPushNotificationPermission();
      //TODO подставить нужный id в onesignal
      //await OneSignal.shared.setAppId('bla-bla-bla');
    } catch (e) {

    }
  }

  @override
  void initState() {
    super.initState();
    final AppsFlyerOptions options = AppsFlyerOptions(
        afDevKey: '8Udyuyuvv4GijTx5NxyiDK',
        showDebug: true,
    );
    _appsflyerSdk = AppsflyerSdk(options);
    _appsflyerSdk.onAppOpenAttribution((res) {
      print("onAppOpenAttribution res: " + res.toString());
      setState(() {
        _deepLinkData = res;
      });
    });
    _appsflyerSdk.onInstallConversionData((res) {
      print("onInstallConversionData res: " + res.toString());
      setState(() {
        _gcd = res;
      });
    });
    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          print(dp.deepLink?.toString());
          print("deep link value: ${dp.deepLink?.deepLinkValue}");
          break;
        case Status.NOT_FOUND:
          print("deep link not found");
          break;
        case Status.ERROR:
          print("deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          print("deep link status parsing error");
          break;
      }
      print("onDeepLinking res: " + dp.toString());
      setState(() {
        _deepLinkData = dp.toJson();
      });
    });
    pageStore.handleStartupLogic();
    initNotify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: _appsflyerSdk.initSdk(
              registerConversionDataCallback: true,
              registerOnAppOpenAttributionCallback: false,
              registerOnDeepLinkingCallback: true,
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return Observer(builder: (context) {
                  if (pageStore.isBusy) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (pageStore.shouldOpenTheDummyApp) {
                    return MainPage(
                      onData: _gcd,
                    );
                  } else {
                    return SafeArea(
                      child: WebViewPage(url: pageStore.url),
                    );
                  }
                });
              } else {
                return const Center(
                  child: Text("Error initializing sdk"),
                );
              }
            }
          }),
    );
  }
}
