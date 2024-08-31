import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String title,
  required IconData icon,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      content: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              letterSpacing: 0.3,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
