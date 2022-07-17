import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:greengrocer/src/auth/sign_up_screen.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          // Get.to(SignUpScreen());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) {
                return SignUpScreen();
              },
            ),
          );
        },
        child: const Text(
          'Criar conta',
          style: const TextStyle(fontSize: 21),
        ),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: Colors.green,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
      ),
    );
  }
}
