import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  const CustomOutlinedButton({
    Key? key,
    this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          label,
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
