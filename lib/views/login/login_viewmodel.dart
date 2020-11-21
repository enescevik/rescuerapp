import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rescuerapp/apis/user_api.dart';
import 'package:rescuerapp/app/locator.dart';
import 'package:rescuerapp/app/router.gr.dart';
import 'package:rescuerapp/app/setup_dialog_ui.dart';
import 'package:rescuerapp/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _dialog = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();

  final _userApi = locator<UserApi>();

  final mailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final focus = FocusNode();

  bool showPassword = false;
  void togglePassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  String get version => _preferences.version;

  Future<void> login() async {
    if (mailTextController.value.text.isEmpty) {
      await _dialog.showDialog(
        title: 'widget.warning'.tr(),
        description: 'login.mail_empty'.tr(),
      );
    } else if (passwordTextController.value.text.isEmpty) {
      await _dialog.showDialog(
        title: 'widget.warning'.tr(),
        description: 'login.password_empty'.tr(),
      );
    } else {
      _dialog.showCustomDialog(
        variant: DialogType.loading,
        description: 'login.logging'.tr(),
      );

      try {
        _preferences.currentUser = await _userApi.login(
          mail: mailTextController.text,
          password: passwordTextController.text,
        );
        _navigationService.back();

        _navigationService.navigateTo(Routes.homeView);
      } catch (e) {
        await _dialog.showDialog(
          title: 'widget.warning'.tr(),
          description: e.message,
        );
        _navigationService.back();
      }
    }
  }
}
