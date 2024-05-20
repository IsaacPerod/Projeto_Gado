import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mostrarSnackBar(
  {required BuildContext context, 
  required String texto, 
  bool isErro = true}) {
  SnackBar snackBar = SnackBar(
      content: Text(texto),
      backgroundColor: isErro ? Colors.red : Colors.green,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}