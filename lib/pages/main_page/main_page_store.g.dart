// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageStore on _MainPageStore, Store {
  late final _$loadingAtom =
      Atom(name: '_MainPageStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$chosenLeagueIndexAtom =
      Atom(name: '_MainPageStore.chosenLeagueIndex', context: context);

  @override
  int get chosenLeagueIndex {
    _$chosenLeagueIndexAtom.reportRead();
    return super.chosenLeagueIndex;
  }

  @override
  set chosenLeagueIndex(int value) {
    _$chosenLeagueIndexAtom.reportWrite(value, super.chosenLeagueIndex, () {
      super.chosenLeagueIndex = value;
    });
  }

  late final _$chosenTabIndexAtom =
      Atom(name: '_MainPageStore.chosenTabIndex', context: context);

  @override
  int get chosenTabIndex {
    _$chosenTabIndexAtom.reportRead();
    return super.chosenTabIndex;
  }

  @override
  set chosenTabIndex(int value) {
    _$chosenTabIndexAtom.reportWrite(value, super.chosenTabIndex, () {
      super.chosenTabIndex = value;
    });
  }

  late final _$matchesAtom =
      Atom(name: '_MainPageStore.matches', context: context);

  @override
  List<MatchModel> get matches {
    _$matchesAtom.reportRead();
    return super.matches;
  }

  @override
  set matches(List<MatchModel> value) {
    _$matchesAtom.reportWrite(value, super.matches, () {
      super.matches = value;
    });
  }

  late final _$teamsAtom = Atom(name: '_MainPageStore.teams', context: context);

  @override
  List<TableItemModel> get teams {
    _$teamsAtom.reportRead();
    return super.teams;
  }

  @override
  set teams(List<TableItemModel> value) {
    _$teamsAtom.reportWrite(value, super.teams, () {
      super.teams = value;
    });
  }

  late final _$scorersAtom =
      Atom(name: '_MainPageStore.scorers', context: context);

  @override
  List<ScorerModel> get scorers {
    _$scorersAtom.reportRead();
    return super.scorers;
  }

  @override
  set scorers(List<ScorerModel> value) {
    _$scorersAtom.reportWrite(value, super.scorers, () {
      super.scorers = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_MainPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$loadStandingsAsyncAction =
      AsyncAction('_MainPageStore.loadStandings', context: context);

  @override
  Future<void> loadStandings() {
    return _$loadStandingsAsyncAction.run(() => super.loadStandings());
  }

  late final _$loadScorersAsyncAction =
      AsyncAction('_MainPageStore.loadScorers', context: context);

  @override
  Future<void> loadScorers() {
    return _$loadScorersAsyncAction.run(() => super.loadScorers());
  }

  late final _$chooseLeagueAsyncAction =
      AsyncAction('_MainPageStore.chooseLeague', context: context);

  @override
  Future<void> chooseLeague(int leagueIndex) {
    return _$chooseLeagueAsyncAction.run(() => super.chooseLeague(leagueIndex));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
chosenLeagueIndex: ${chosenLeagueIndex},
chosenTabIndex: ${chosenTabIndex},
matches: ${matches},
teams: ${teams},
scorers: ${scorers}
    ''';
  }
}
