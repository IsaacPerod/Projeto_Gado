import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String text;

  const Input(this.controller, this.text, {Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: widget.controller,
              obscureText: widget.text == 'Senha' ? _obscureText : false,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                  ),
                ),
                label: Text(widget.text),
                suffixIcon: widget.text == 'Senha'
                    ? IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      )
                    : Icon(
                        widget.text == 'E-mail'
                            ? Icons.email
                            : widget.text == 'Nome'
                                ? Icons.person
                                : null,
                      ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}