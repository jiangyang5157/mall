import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:mall/src/pages/app/app.dart';
import 'package:mall/src/parse/parse.dart';
import 'package:mall/src/core/core.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  Future<void> initialize() async {
    // init Parse
    Parse().initialize(parseApplicationId, parseServerUrl,
        appName: parseApplicationName, masterKey: parseMasterKey, debug: true);

    // init database
    await DbProvider().initialize();

    // init repositories
    UserRepository().initialize(DbProvider().db);

    dispatch(AppInitializedEvent());
  }

  @override
  AppState get initialState {
    initialize();
    return AppUninitializedState();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppInitializedEvent) {
      yield AppInitializedState();
    }

    if (event is AppSignedInEvent) {
      yield AppAuthenticatedState();
    }

    if (event is AppSignedOutEvent) {
      yield AppUnauthenticatedState();
    }
  }
}
