import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_outlined_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';

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
                        validator: (email) {
                          if (email == null || email.isEmpty) return 'Digite seu email';
                          //
                          if (!email.isEmail) return 'Digite um email válido';

                          return null;
                        },
                      ),
                      // Senha
                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.password,
                        labelText: 'Senha',
                        obscureText: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) return 'Digite sua senha';
                          if (password.length <= 3) return 'Digite no min 3 dígitos';
                          return null;
                        },
                      ),

                      CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint('Todos os campos estão válidos');
                            debugPrint(emailController.text);
                            debugPrint(passwordController.text);
                          } else {
                            debugPrint('Campos não estão válidos');
                          }
                          // Get.offNamed(PagesRoutes.baseRoutes);
                        },
                        label: 'Entrar',
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
