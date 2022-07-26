import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final IconData? icon;
  final double height;
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: height / 2,
        ),
        label: Text(
          label,
          style: TextStyle(fontSize: height / 2),
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
