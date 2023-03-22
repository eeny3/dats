import 'package:firebase_remote_config/firebase_remote_config.dart';

const String _url =  'url';
const String _switch =  'switch';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;
  final defaults = <String, dynamic>{_url: 'https://www.youtube.com/', _switch: false};
  static late RemoteConfigService _instance;

  static RemoteConfigService? getInstance() {
    _instance = RemoteConfigService(
      remoteConfig: FirebaseRemoteConfig.instance,
    );
    return _instance;
  }

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  String get url => _remoteConfig.getString(_url);
  bool get switchField => _remoteConfig.getBool(_switch);

  Future initialize() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 30),
      ));
      await _fetchAndActivate();
    } catch (e) {
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.fetch();
    await _remoteConfig.activate();
  }
}
