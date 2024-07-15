import 'package:flutter/material.dart';

InputDecoration kInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: const EdgeInsets.all(10),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.black,
      ),
    ),
  );
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text(text),
      icon: Icon(icon),
      style: ButtonStyle(
        backgroundColor:
            WidgetStateColor.resolveWith((states) => Colors.yellow),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const TextButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
