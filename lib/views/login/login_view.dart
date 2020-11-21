import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rescuerapp/app/router.gr.dart';
import 'package:rescuerapp/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              _Logo(),
              _Version(),
              SizedBox(height: 20.0),
              _UserTextField(),
              SizedBox(height: 10.0),
              _PasswordTextField(),
              SizedBox(height: 20.0),
              _LoginButton(),
              SizedBox(height: 20.0),
              _ResetPasswordButton(),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Routes.settingsView),
          child: Icon(Icons.settings),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Image(image: AssetImage('assets/images/logo.png')),
    );
  }
}

class _Version extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, right: 40.0),
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'version'.tr(args: [model.version]),
          style: TextStyle(color: Color(0xFF777777)),
        ),
      ),
    );
  }
}

class _UserTextField extends HookViewModelWidget<LoginViewModel> {
  _UserTextField({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    return TextField(
      autofocus: true,
      focusNode: model.focus,
      controller: model.mailTextController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'login.mail'.tr(),
        prefixIcon: Icon(Icons.mail),
      ),
    );
  }
}

class _PasswordTextField extends HookViewModelWidget<LoginViewModel> {
  _PasswordTextField({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    return TextField(
      controller: model.passwordTextController,
      obscureText: !model.showPassword,
      decoration: InputDecoration(
        labelText: 'login.password'.tr(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            model.showPassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: model.togglePassword,
        ),
      ),
    );
  }
}

class _LoginButton extends ViewModelWidget<LoginViewModel> {
  const _LoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return RaisedButton(
      child: Text('login.login'.tr()),
      onPressed: () {
        model.focus.unfocus();
        model.login();
      },
    );
  }
}

class _ResetPasswordButton extends ViewModelWidget<LoginViewModel> {
  const _ResetPasswordButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return FlatButton(
      child: Text(
        'login.reset_password'.tr(),
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      onPressed: () {},
    );
  }
}
