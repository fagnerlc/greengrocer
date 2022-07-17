import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final IconData? suffixIcon;
  final String labelText;
  final bool obscureText;
  final Function()? iconButtonAction;
  final bool? maskCpfFormartter;
  final bool? maskDateFormartter;
  final bool? maskCnpjFormartter;
  final bool? maskPhoneFormartter;
  CustomTextField({
    Key? key,
    required this.icon,
    required this.labelText,
    this.obscureText = false,
    this.iconButtonAction,
    this.suffixIcon,
    this.maskDateFormartter = false,
    this.maskPhoneFormartter = false,
    this.maskCpfFormartter = false,
    this.maskCnpjFormartter = false,
  }) : super(key: key);

  final noMask = MaskTextInputFormatter();
  final dateFormartter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormartter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final cpfFormartter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final cnpjFormartter = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    RxBool thisObscureText = RxBool(obscureText);
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Obx(
        () => TextFormField(
            inputFormatters: [
              maskCpfFormartter! ? cpfFormartter : noMask,
              maskDateFormartter! ? dateFormartter : noMask,
              maskCnpjFormartter! ? cnpjFormartter : noMask,
              maskPhoneFormartter! ? phoneFormartter : noMask,
            ],
            obscureText: thisObscureText.value,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              suffixIcon: obscureText == true && iconButtonAction == null
                  ? IconButton(
                      onPressed: () {
                        thisObscureText.value = !thisObscureText.value;
                      },
                      icon: thisObscureText.value ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    )
                  : iconButtonAction != null
                      ? IconButton(
                          onPressed: iconButtonAction,
                          icon: Icon(suffixIcon),
                        )
                      : null,
              labelText: labelText,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            )),
      ),
    );
  }
}
