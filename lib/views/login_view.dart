import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanta_demo_app/providers/demo_provider.dart';
import 'package:quanta_demo_app/shared/theme/app_colors.dart';
import 'package:quanta_demo_app/shared/theme/app_text_styles.dart';
import 'package:quanta_demo_app/views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const route = 'login_view';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var obscureText = true;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final demoProvider = Provider.of<DemoProvider>(context);

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.bottomCenter,
        color: AppColors.appRed,
        child: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Iniciar sesión',
                style: AppTextStyles.whiteText.copyWith(
                  fontSize: 36,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Correo electronico',
                style: AppTextStyles.greyText.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'E-mail@hola.com'),
              ),
              const SizedBox(height: 16),
              Text(
                'Contraseña',
                style: AppTextStyles.greyText.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: passController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: '**********',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: '¿Has olvidado tu contraseña?',
                    style: AppTextStyles.greyText,
                    children: [
                      TextSpan(
                        text: '  Restablecerla',
                        style: AppTextStyles.greyText.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.maxFinite,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.black,
                  onPressed: () async {
                    await demoProvider
                        .login(emailController.text, passController.text)
                        .then((value) {
                      if (demoProvider.currentSession != null) {
                        Navigator.pushNamed(context, HomeView.route);
                      }
                    });
                  },
                  label: const Text(
                    'Iniciar Sesión',
                    style: AppTextStyles.whiteText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
