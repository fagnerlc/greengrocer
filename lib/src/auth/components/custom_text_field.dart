import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final IconData? suffixIcon;
  final String labelText;
  final bool obscureText;
  final Function()? iconButtonAction;
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.labelText,
    this.obscureText = false,
    this.iconButtonAction,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool thisObscureText = RxBool(obscureText);
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Obx(
        () => TextFormField(
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
