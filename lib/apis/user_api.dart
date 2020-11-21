import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rescuerapp/apis/base_api.dart';
import 'package:rescuerapp/apis/models/user/user.dart';
import 'package:rescuerapp/app/locator.dart';
import 'package:rescuerapp/services/analytics_service.dart';

@lazySingleton
class UserApi extends BaseApi {
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  Future<User> login({@required String mail, @required String password}) async {
    final user = User(
      id: 1,
      mail: 'rescuerapp@borusan.com',
      name: 'rescuerapp',
      surname: 'borusan',
      phoneNumber: '',
      token: '',
    );
    // final url = 'user/login?mail=$mail&password=$password';
    // final user = await getData(url, User());

    _analyticsService.logLogin();
    _analyticsService.setUserProperties(
      userId: user.id.toString(),
      mail: user.mail,
      name: user.name,
      surname: user.surname,
    );
    return user;
  }
}
