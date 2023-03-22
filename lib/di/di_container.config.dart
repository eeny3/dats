// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../pages/main_page/main_page_store.dart' as _i4;
import '../pages/startup_page/startup_page_store.dart' as _i7;
import '../repositories/match_repository.dart' as _i9;
import '../repositories/scorers_repository.dart' as _i6;
import '../repositories/table_repository.dart' as _i8;
import '../service/modules/network_module.dart' as _i10;
import '../service/networking/client.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Dio>(networkModule.dio);
  gh.factory<_i4.MainPageStore>(() => _i4.MainPageStore());
  gh.singleton<_i5.RestClient>(_i5.RestClient.create(get<_i3.Dio>()));
  gh.lazySingleton<_i6.ScorersRepository>(
      () => _i6.ScorersRepository(get<_i5.RestClient>()));
  gh.factory<_i7.StartupPageStore>(() => _i7.StartupPageStore());
  gh.lazySingleton<_i8.TableRepository>(
      () => _i8.TableRepository(get<_i5.RestClient>()));
  gh.lazySingleton<_i9.MatchRepository>(
      () => _i9.MatchRepository(get<_i5.RestClient>()));
  return get;
}

class _$NetworkModule extends _i10.NetworkModule {}
