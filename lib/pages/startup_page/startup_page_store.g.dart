// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartupPageStore on _StartupPageStore, Store {
  late final _$shouldOpenTheDummyAppAtom =
      Atom(name: '_StartupPageStore.shouldOpenTheDummyApp', context: context);

  @override
  bool get shouldOpenTheDummyApp {
    _$shouldOpenTheDummyAppAtom.reportRead();
    return super.shouldOpenTheDummyApp;
  }

  @override
  set shouldOpenTheDummyApp(bool value) {
    _$shouldOpenTheDummyAppAtom.reportWrite(value, super.shouldOpenTheDummyApp,
        () {
      super.shouldOpenTheDummyApp = value;
    });
  }

  late final _$isBusyAtom =
      Atom(name: '_StartupPageStore.isBusy', context: context);

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  late final _$urlAtom = Atom(name: '_StartupPageStore.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$handleStartupLogicAsyncAction =
      AsyncAction('_StartupPageStore.handleStartupLogic', context: context);

  @override
  Future<dynamic> handleStartupLogic() {
    return _$handleStartupLogicAsyncAction
        .run(() => super.handleStartupLogic());
  }

  @override
  String toString() {
    return '''
shouldOpenTheDummyApp: ${shouldOpenTheDummyApp},
isBusy: ${isBusy},
url: ${url}
    ''';
  }
}
