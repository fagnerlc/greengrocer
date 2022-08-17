import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';

import '../../../services/validators.dart';

class SignUpScreen extends GetView<AuthController> {
  SignUpScreen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

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
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              icon: Icons.email,
                              labelText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                              onSaved: (value) {
                                controller.user.email = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.lock,
                              labelText: 'Senha',
                              obscureText: true,
                              validator: passwordValidator,
                              onSaved: (value) {
                                controller.user.password = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.person,
                              labelText: 'Nome',
                              keyboardType: TextInputType.name,
                              validator: nameValidator,
                              onSaved: (value) {
                                controller.user.name = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              labelText: 'Celular',
                              maskPhoneFormartter: true,
                              keyboardType: TextInputType.phone,
                              validator: phoneValidator,
                              onSaved: (value) {
                                controller.user.phone = value;
                              },
                            ),
                            CustomTextField(
                              icon: Icons.file_copy,
                              labelText: 'CPF',
                              maskCpfFormartter: true,
                              keyboardType: TextInputType.number,
                              validator: cpfValidator,
                              onSaved: (value) {
                                controller.user.cpf = value;
                              },
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
                                                if (_formkey.currentState!.validate()) {
                                                  _formkey.currentState!.save();
                                                  controller.signUp();
                                                }
                                              },
                                        label: 'Cadastrar usuário',
                                      );
                              },
                            ),
                          ],
                        ),
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
