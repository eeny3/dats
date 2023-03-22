import 'package:dats/models/exceptions/exceptions.dart';
import 'package:dats/models/matches_list_model/matches_list_model.dart';
import 'package:dats/models/scorers_list_model/scorers_list_model.dart';
import 'package:dats/models/standings_list_model/standings_list_model.dart';
import 'package:dats/service/networking/client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ScorersRepository {
  final RestClient _client;

  ScorersRepository(this._client);

  Future<ScorersListModel> getPlScorers() async {
    try {
      return await _client.getPlScorers();
    } on DioError catch (e) {
      //TODO
      // if (e.type == DioErrorType.response) {
      //   throw ServerException.fromDioError(e);
      // } else {
      //   throw NetworkException.fromDioErrorType(e.type);
      // }
      throw NetworkException.fromDioErrorType(e.type);
    } catch (e) {
      throw ApplicationException(e);
    }
  }

  Future<ScorersListModel> getClScorers() async {
    return await _client.getClScorers();
  }

  Future<ScorersListModel> getBl1Scorers() async {
    try {
      return await _client.getBL1Scorers();
    } on DioError catch (e) {
      //TODO
      // if (e.type == DioErrorType.response) {
      //   throw ServerException.fromDioError(e);
      // } else {
      //   throw NetworkException.fromDioErrorType(e.type);
      // }
      throw NetworkException.fromDioErrorType(e.type);
    } catch (e) {
      throw ApplicationException(e);
    }
  }
}