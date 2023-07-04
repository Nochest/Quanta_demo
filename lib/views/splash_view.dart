import 'package:flutter/material.dart';
import 'package:quanta_demo_app/shared/theme/app_text_styles.dart';
import 'package:quanta_demo_app/views/login_view.dart';
import 'package:quanta_demo_app/views/register_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const route = 'splash_view';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'BIYON',
                  style: AppTextStyles.whiteText.copyWith(fontSize: 48),
                ),
                const Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.black,
                    onPressed: () =>
                        Navigator.pushNamed(context, RegisterView.route),
                    label: const Text(
                      'Crear Cuenta',
                      style: AppTextStyles.whiteText,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, LoginView.route),
                  child: RichText(
                    text: TextSpan(
                      text: '¿Ya tienes una cuenta?',
                      style: AppTextStyles.greyText,
                      children: [
                        TextSpan(
                          text: '  Inicia sesión',
                          style: AppTextStyles.greyText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
