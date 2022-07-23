import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_outlined_button.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        // BouncingScrollPhysics:se for aberto em tela menor que não apresenta mais a borda efetuando um efeito
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Email
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.email,
            icon: Icons.email,
            labelText: 'Email',
          ),

          // Nome
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person,
            labelText: 'Nome',
          ),

          // Celular
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.phone,
            icon: Icons.phone,
            labelText: 'Celular',
            maskPhoneFormartter: true,
          ),

          // CPF
          CustomTextField(
            readOnly: true,
            initialValue: app_data.user.cpf,
            icon: Icons.file_copy,
            labelText: 'CPF',
            obscureText: true,
          ),

          //Botão para atualizar a senha
          CustomOutlinedButton(
              onPressed: () {
                updatePassword();
              },
              label: 'Atualizar Senha')
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomTextField(
                        obscureText: true,
                        icon: Icons.lock,
                        labelText: 'Senha Atual',
                      ),
                      CustomTextField(
                        obscureText: true,
                        icon: Icons.lock_outline,
                        labelText: 'Nova Senha',
                      ),
                      CustomTextField(
                        obscureText: true,
                        icon: Icons.lock_outline,
                        labelText: 'Confirmar Nova Senha',
                      ),

                      // Botão de confirmação
                      CustomElevatedButton(
                        label: 'Atualizar',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 7,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
