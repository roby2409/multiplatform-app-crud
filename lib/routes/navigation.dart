import 'package:flutter/material.dart';
import 'package:multiplatform_app_crud/presentation/pages/splash_page.dart';
import 'package:multiplatform_app_crud/presentation/pages/users/users_page.dart';

import 'routes.dart';

Map<String, WidgetBuilder> mapRegisterRoutes() {
  return <String, WidgetBuilder>{
    AccurateApp.splashPage: (context) => const SplashPage(),
    AccurateApp.userPage: (context) => const UsersPage(),
  };
}

Route? mapRegisterRoutesWithParameters(RouteSettings settings) {}
