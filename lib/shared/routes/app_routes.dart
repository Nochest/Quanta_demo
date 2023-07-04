import 'package:flutter/material.dart';
import 'package:quanta_demo_app/views/home_view.dart';
import 'package:quanta_demo_app/views/login_view.dart';
import 'package:quanta_demo_app/views/register_view.dart';
import 'package:quanta_demo_app/views/splash_view.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    SplashView.route: (_) => const SplashView(),
    LoginView.route: (_) => const LoginView(),
    RegisterView.route: (_) => const RegisterView(),
    HomeView.route: (_) => const HomeView(),
  };
}
