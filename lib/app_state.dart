import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _searchUsers = false;
  bool get searchUsers => _searchUsers;
  set searchUsers(bool value) {
    _searchUsers = value;
  }

  final _appUsersManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> appUsers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _appUsersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppUsersCache() => _appUsersManager.clear();
  void clearAppUsersCacheKey(String? uniqueKey) =>
      _appUsersManager.clearRequest(uniqueKey);
}
