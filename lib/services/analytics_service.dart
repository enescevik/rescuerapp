import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future setUserProperties({
    @required String userId,
    String mail,
    String name,
    String surname,
  }) async {
    await _analytics.setUserId(userId);
    await _analytics.setUserProperty(name: 'mail', value: mail);
    await _analytics.setUserProperty(name: 'name', value: name);
    await _analytics.setUserProperty(name: 'surname', value: surname);
  }

  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'mail');
  }

  Future logHttp({
    @required String name,
    @required String body,
    String requestJson,
  }) async {
    var parameters = requestJson == null
        ? {'body': body}
        : {'request': requestJson, 'body': body};

    await _analytics.logEvent(name: name, parameters: parameters);
  }
}
