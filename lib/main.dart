import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanta_demo_app/providers/demo_provider.dart';
import 'package:quanta_demo_app/shared/routes/app_routes.dart';
import 'package:quanta_demo_app/shared/theme/app_theme.dart';
import 'package:quanta_demo_app/views/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Client client;
late SharedPreferences localStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localStorage = await SharedPreferences.getInstance();
  client = Client();
  client
      .setEndpoint('https://backend-vsoul.quantas.cloud/v1')
      .setProject('64a44d9d7a8acd3d6141');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => DemoProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quanta App Demo',
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: SplashView.route,
    );
  }
}
