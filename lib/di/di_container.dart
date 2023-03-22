import 'package:dats/service/remote_config_service/remote_config_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async {
  final remoteConfigService = await RemoteConfigService.getInstance();
  getIt.registerSingleton<RemoteConfigService>(remoteConfigService!);
  await $initGetIt(getIt);
  return getIt.allReady();
}