import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../injection/injector.dart';
import '../../shared/mixin/log_mixin.dart';
import '../data_storage/secure_storage/flutter_secure_storage_client.dart';
import '../data_storage/secure_storage/flutter_secure_storage_key.dart';
import '../data_storage/shared_preferences/shared_preferences_client.dart';
import '../data_storage/shared_preferences/shared_preferences_key.dart';

/// Use instance of SessionManager to store user data used in the [application].
base class SessionManager extends ChangeNotifier with LogMixin {
  SessionManager._();

  static SessionManager? _instance;

  static SessionManager instance = _instance ??= SessionManager._();

  SharedPreferencesClient get _sharedPreferencesClient =>
      getIt<SharedPreferencesClient>();

  FlutterSecureStorageClient get _secureStorageClient =>
      getIt<FlutterSecureStorageClient>();

  String? accessToken;
  String? refreshToken;

  // Thay đổi lại ds đặt lịch khi có thay đổi
  bool hasChangeBookingList = false;

  bool get isLoggedIn => accessToken != null;

  bool get canRefreshToken => refreshToken != null;

  Future<void> init() async {
    try {
      await _clearSecureStorageOnReinstall();

      accessToken = await readAccessToken();

      refreshToken = await readRefreshToken();

      logD('Session initialization successful');
    } catch (e) {
      logE('Session initialization failed.', error: e);
    } finally {
      notifyListeners();
    }
  }

  bool _isClearing = false;

  /// [message], which provides the usage context.
  /// [displayMessage], which uses to display notifications to the user interface.
  Future<void> clearSession({String? message, String? displayMessage}) async {
    if (_isClearing) {
      return;
    }

    try {
      _isClearing = true;

      accessToken = null;
      refreshToken = null;
      // if (kIsWeb) {
      //   await _sharedPreferencesClient.delete(SecureStorageKey.accessToken);
      //   await _sharedPreferencesClient.delete(SecureStorageKey.refreshToken);
      //   await _sharedPreferencesClient.delete(SecureStorageKey.userData);
      // } else {
      //   await _secureStorageClient.delete(SecureStorageKey.accessToken);
      //   await _secureStorageClient.delete(SecureStorageKey.refreshToken);
      //   await _secureStorageClient.delete(SecureStorageKey.userData);
      // }

      logD('Current session data has been cleaned');
    } catch (e) {
      logE('An error occurred while cleaning session data', error: e);
    } finally {
      _isClearing = false;
      notifyListeners();
    }
  }

  @protected
  Future<String?> readAccessToken() async {
    if (kIsWeb) {
      return _sharedPreferencesClient.read(SecureStorageKey.accessToken);
    }
    return _secureStorageClient.read(SecureStorageKey.accessToken);
  }

  @protected
  Future<String?> readRefreshToken() async {
    if (kIsWeb) {
      return _sharedPreferencesClient.read(SecureStorageKey.refreshToken);
    }
    return await _secureStorageClient.read(SecureStorageKey.refreshToken);
  }

  Future<void> saveAccessToken(String value) async {
    if (kIsWeb) {
      await _sharedPreferencesClient.write(SecureStorageKey.accessToken, value);
    } else {
      await _secureStorageClient.write(SecureStorageKey.accessToken, value);
    }
    accessToken = value;
  }

  Future<void> saveRefreshToken(String value) async {
    if (kIsWeb) {
      await _sharedPreferencesClient.write(
        SecureStorageKey.refreshToken,
        value,
      );
    } else {
      await _secureStorageClient.write(SecureStorageKey.refreshToken, value);
    }
    refreshToken = value;
  }

  // https://github.com/juliansteenbakker/flutter_secure_storage/issues/88,  fix issue reinstall app
  Future<void> _clearSecureStorageOnReinstall() async {
    const String key = SharedPreferencesKey.thisAppHasRunBefore;
    if (_sharedPreferencesClient.containsKey(key)) {
      final bool? hasRunBefore = _sharedPreferencesClient.getBool(key);
      if (hasRunBefore ?? false) {
        return;
      }
    }

    await _secureStorageClient.clearAll();
    await _sharedPreferencesClient.write(key, true);
  }
}
