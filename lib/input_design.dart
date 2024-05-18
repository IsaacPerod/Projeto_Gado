import 'package:flutter/material.dart';

class InputDesign extends StatelessWidget{
  const InputDesign(this.controller, this.text, {super.key});

final TextEditingController controller;
final String text;

@override
  Widget build (context){ 
    return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: text,
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                      ),
                    ),
                  );
  }
}
