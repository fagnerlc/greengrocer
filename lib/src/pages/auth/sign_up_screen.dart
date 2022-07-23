import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: size.height,
            width: size.width < 800 ? size.width : size.width / 2,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                    // Formulário
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            49,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(icon: Icons.email, labelText: 'Email'),
                          CustomTextField(
                            icon: Icons.lock,
                            labelText: 'Senha',
                            obscureText: true,
                          ),
                          CustomTextField(
                            icon: Icons.person,
                            labelText: 'Nome',
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            labelText: 'Celular',
                            maskPhoneFormartter: true,
                          ),
                          CustomTextField(
                            icon: Icons.file_copy,
                            labelText: 'CPF',
                            maskCpfFormartter: true,
                          ),
                          CustomElevatedButton(
                            onPressed: () {},
                            label: 'Cadastrar',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
