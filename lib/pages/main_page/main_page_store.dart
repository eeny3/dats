import 'package:dats/models/match_model/match_model.dart';
import 'package:dats/models/scorer_model/scorer_model.dart';
import 'package:dats/models/table_item_model/table_item_model.dart';
import 'package:dats/repositories/match_repository.dart';
import 'package:dats/repositories/scorers_repository.dart';
import 'package:dats/repositories/table_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'main_page_store.g.dart';

@injectable
class MainPageStore = _MainPageStore with _$MainPageStore;

abstract class _MainPageStore with Store {

  final MatchRepository _matchRepository = GetIt.I();
  final TableRepository _tableRepository = GetIt.I();
  final ScorersRepository _scorersRepository = GetIt.I();

  @observable
  bool loading = false;

  @observable
  int chosenLeagueIndex = 0;

  @observable
  int chosenTabIndex = 0;

  @observable
  List<MatchModel> matches = [];

  @observable
  List<TableItemModel> teams = [];

  @observable
  List<ScorerModel> scorers = [];

  @action
  Future<void> loadPage() async {
    loading = true;
    final response = await _matchRepository.getClMatches();
    matches = response.matches;
    loading = false;
  }

  @action
  Future<void> loadStandings() async {
    loading = true;
    dynamic response;
    if(chosenLeagueIndex == 0) {
      response = await _tableRepository.getClTable();
    }
    if(chosenLeagueIndex == 1) {
      response = await _tableRepository.getPlTable();
    }
    if(chosenLeagueIndex == 2) {
      response = await _tableRepository.getBl1Table();
    }
    teams = response.standings.first.table;
    loading = false;
  }

  @action
  Future<void> loadScorers() async {
    loading = true;
    dynamic response;
    if(chosenLeagueIndex == 0) {
      response = await _scorersRepository.getClScorers();
    }
    if(chosenLeagueIndex == 1) {
      response = await _scorersRepository.getPlScorers();
    }
    if(chosenLeagueIndex == 2) {
      response = await _scorersRepository.getBl1Scorers();
    }
    scorers = response.scorers;
    loading = false;
  }

  @action
  Future<void> chooseLeague(int leagueIndex) async {
    chosenLeagueIndex = leagueIndex;
    loading = true;
    dynamic response;
    if(leagueIndex == 0) {
      response = await _matchRepository.getClMatches();
    }
    if(leagueIndex == 1) {
      response = await _matchRepository.getPlMatches();
    }
    if(leagueIndex == 2) {
      response = await _matchRepository.getBl1Matches();
    }
    matches = response.matches;
    loading = false;
  }
}