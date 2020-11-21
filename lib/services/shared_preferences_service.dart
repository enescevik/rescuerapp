import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info/package_info.dart';
import 'package:rescuerapp/apis/models/user/user.dart';
import 'package:rescuerapp/views/settings/models/environment.dart' as env;
import 'package:rescuerapp/views/settings/models/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  static PackageInfo _packageInfo;
  static SharedPreferences _localStorage;

  static Future init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    _localStorage = await SharedPreferences.getInstance();
  }

  String get version => _packageInfo.version;

  String get packageName => _packageInfo.packageName;

  bool get isDebug => !kReleaseMode;

  User currentUser;

  Language _language;
  Language get language => _language ??= LanguageModel.languages.firstWhere(
      (e) => e.id == _localStorage?.getInt('languageId'),
      orElse: () => null);
  set language(Language value) {
    _language = value;
    _localStorage?.setInt('languageId', value.id);
  }

  env.Environment _environment;
  env.Environment get environment =>
      _environment ??= env.EnvironmentModel.environments.firstWhere(
          (e) => e.id == _localStorage?.getInt('environmentId'),
          orElse: () => null);
  set environment(env.Environment value) {
    _environment = value;
    _localStorage?.setInt('environmentId', value.id);
  }

  String _themeMode;
  String get themeMode => _themeMode ??= _localStorage.getString('themeMode');
  set themeMode(String value) {
    _themeMode = value;
    _localStorage?.setString('themeMode', value);
  }

  bool _darkModeEnabled;
  bool get darkModeEnabled =>
      _darkModeEnabled ??= _localStorage.getBool('darkModeEnabled');
  set darkModeEnabled(bool value) {
    _darkModeEnabled = value;
    _localStorage?.setBool('darkModeEnabled', value);
  }
}
