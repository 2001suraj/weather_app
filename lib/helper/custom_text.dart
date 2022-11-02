 import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Padding custom_text({required String text, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
