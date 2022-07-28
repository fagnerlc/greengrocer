import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_outlined_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email
                    CustomTextField(
                      icon: Icons.email,
                      labelText: 'Email',
                      iconButtonAction: () {
                        debugPrint('object');
                      },
                      suffixIcon: Icons.mail,
                    ),
                    // Senha
                    CustomTextField(
                      icon: Icons.password,
                      labelText: 'Senha',
                      obscureText: true,
                    ),

                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (builder) {
                              return BaseScreen();
                            },
                          ),
                        );
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                      label: 'Criar Conta',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
