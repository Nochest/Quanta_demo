import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanta_demo_app/main.dart';
import 'package:quanta_demo_app/providers/demo_provider.dart';
import 'package:quanta_demo_app/shared/theme/app_colors.dart';
import 'package:quanta_demo_app/shared/theme/app_text_styles.dart';
import 'package:quanta_demo_app/views/splash_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const route = 'home_view';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final demoProvider = Provider.of<DemoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(demoProvider.currentSession!.clientName),
              subtitle: Text(demoProvider.currentAccount!.email),
              trailing: const Icon(Icons.photo),
            ),
            SizedBox(height: 16),
            MaterialButton(
              color: AppColors.appRed,
              onPressed: () {
                localStorage.remove('user');
                localStorage.remove('email');
                Navigator.pushNamedAndRemoveUntil(
                    context, SplashView.route, (route) => false);
              },
              child: const Text(
                'Logout',
                style: AppTextStyles.whiteText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
