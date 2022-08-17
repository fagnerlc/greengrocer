import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_outlined_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/validators.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        // todo controlo o tamanho da coluna
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do App
                    const AppNameWidget(
                      greenTileColor: Colors.white,
                      textSize: 40,
                    ),
                    // Categorias
                    SizedBox(
                      height: 35,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticínios'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 42,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        labelText: 'Email',
                        iconButtonAction: () {
                          debugPrint('object');
                        },
                        suffixIcon: Icons.mail,
                        validator: emailValidator,
                      ),
                      // Senha
                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.password,
                        labelText: 'Senha',
                        obscureText: true,
                        validator: passwordValidator,
                      ),

                      GetX<AuthController>(
                        init: AuthController(),
                        builder: (authController) {
                          return authController.isLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : CustomElevatedButton(
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          // faz com que o teclado desfoque ao clicar no entrar
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState!.validate()) {
                                            String email = emailController.text;
                                            String password = passwordController.text;
                                            authController.signIn(email: email, password: password);
                                          }
                                        },
                                  label: 'Entrar',
                                );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: CustomColors.customContrastColor),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.blueGrey.withAlpha(97),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.blueGrey.withAlpha(97),
                            ),
                          ),
                        ],
                      ),
                      CustomOutlinedButton(
                        onPressed: () {
                          Get.toNamed(PagesRoutes.signUpRoutes);
                        },
                        label: 'Criar Conta',
                      ),
                    ],
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
