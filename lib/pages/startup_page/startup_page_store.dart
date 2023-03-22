import 'package:dats/service/remote_config_service/remote_config_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'startup_page_store.g.dart';

@injectable
class StartupPageStore = _StartupPageStore with _$StartupPageStore;

abstract class _StartupPageStore with Store {
  final RemoteConfigService _remoteConfigService = GetIt.I();

  @observable
  bool shouldOpenTheDummyApp = false;

  @observable
  bool isBusy = false;

  @observable
  String url = '';

  @action
  Future handleStartupLogic() async {
    isBusy = true;

    await _remoteConfigService.initialize();
    if (_remoteConfigService.switchField) {
      shouldOpenTheDummyApp = false;
      url = _remoteConfigService.url;
    } else {
      shouldOpenTheDummyApp = true;
    }

    isBusy = false;
  }
}
