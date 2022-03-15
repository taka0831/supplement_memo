import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final String label;
  final Color color;

  Button(
      {required this.onPressed,
      required this.icon,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: SizedBox(
        width: double.infinity,
        height: 45.0,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          onPressed: onPressed,
          icon: icon,
          label: Text(
            label,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
