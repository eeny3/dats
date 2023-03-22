import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const String baseApiUrl = "https://api.football-data.org/v4/";
const String apiKey = "bdd3882ccb624e80a45cab57e226d930";

@module
abstract class NetworkModule {
  @singleton
  Dio get dio {
    final options = BaseOptions(
      baseUrl: baseApiUrl,
      headers: {
        'X-Auth-Token': apiKey,
      },
    );

    final dio = Dio(options);
    return dio;
  }
}
