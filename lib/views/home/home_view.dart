import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rescuerapp/app/locator.dart';
import 'package:rescuerapp/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeView extends StatelessWidget {
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Icon(
                title: 'operation.barcode.title'.tr(),
                imageName: 'print.svg',
                routeName: Routes.loginView,
              ),
              SizedBox(height: 10.0),
              _Icon(
                title: 'operation.load.title'.tr(),
                imageName: 'load.svg',
                routeName: Routes.loginView,
              ),
              SizedBox(height: 10.0),
              _Icon(
                title: 'operation.unload.title'.tr(),
                imageName: 'unload.svg',
                routeName: Routes.loginView,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings),
        onPressed: () => _navigationService.navigateTo(Routes.settingsView),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final String title;
  final String imageName;
  final String routeName;

  final _navigationService = locator<NavigationService>();

  _Icon({this.title, this.imageName, this.routeName, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(4.0),
      onPressed: () => _navigationService.navigateTo(routeName),
      child: Column(
        children: [
          // SvgPicture.asset(
          //   'assets/images/$imageName',
          //   height: 100.0,
          //   color: Theme.of(context).brightness == Brightness.dark
          //       ? Colors.white
          //       : null,
          // ),
          SizedBox(height: 6.0),
          Text(title, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
