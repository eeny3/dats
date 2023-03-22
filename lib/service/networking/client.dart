import 'package:dats/models/matches_list_model/matches_list_model.dart';
import 'package:dats/models/scorers_list_model/scorers_list_model.dart';
import 'package:dats/models/standings_list_model/standings_list_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@singleton
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  static RestClient create(Dio dio) {
    return RestClient(dio);
  }

  @GET("competitions/PL/matches?matchday=1")
  Future<MatchesListModel> getPlMatches();

  @GET("competitions/PL/standings")
  Future<StandingsListModel> getPlStandings();

  @GET("competitions/PL/scorers")
  Future<ScorersListModel> getPlScorers();

  @GET("competitions/CL/matches?matchday=1")
  Future<MatchesListModel> getClMatches();

  @GET("competitions/CL/standings")
  Future<StandingsListModel> getClStandings();

  @GET("competitions/CL/scorers")
  Future<ScorersListModel> getClScorers();

  @GET("competitions/BL1/matches?matchday=1")
  Future<MatchesListModel> getBl1Matches();

  @GET("competitions/BL1/standings")
  Future<StandingsListModel> getBL1Standings();

  @GET("competitions/BL1/scorers")
  Future<ScorersListModel> getBL1Scorers();
}
