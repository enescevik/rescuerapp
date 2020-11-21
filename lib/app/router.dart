import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:rescuerapp/views/home/home_view.dart';
import 'package:rescuerapp/views/login/login_view.dart';
import 'package:rescuerapp/views/settings/settings_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LoginView, initial: true),
  CustomRoute(
    page: SettingsView,
    transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
  ),
  MaterialRoute(page: HomeView),
])
class $Router {}
