import 'package:dats/models/exceptions/exceptions.dart';
import 'package:dats/models/matches_list_model/matches_list_model.dart';
import 'package:dats/service/networking/client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MatchRepository {
  final RestClient _client;

  MatchRepository(this._client);

  Future<MatchesListModel> getPlMatches() async {
    try {
      return await _client.getPlMatches();
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

  Future<MatchesListModel> getClMatches() async {
    try {
      return await _client.getClMatches();
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

  Future<MatchesListModel> getBl1Matches() async {
    try {
      return await _client.getBl1Matches();
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