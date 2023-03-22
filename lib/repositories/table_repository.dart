import 'package:dats/models/exceptions/exceptions.dart';
import 'package:dats/models/matches_list_model/matches_list_model.dart';
import 'package:dats/models/standings_list_model/standings_list_model.dart';
import 'package:dats/service/networking/client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TableRepository {
  final RestClient _client;

  TableRepository(this._client);

  Future<StandingsListModel> getPlTable() async {
    try {
      return await _client.getPlStandings();
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

  Future<StandingsListModel> getClTable() async {
    try {
      return await _client.getClStandings();
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

  Future<StandingsListModel> getBl1Table() async {
    try {
      return await _client.getBL1Standings();
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