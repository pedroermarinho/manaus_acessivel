import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final String Function() errorText;
  final TextInputType textInputType;
  final bool obscureText;
  final bool autofocus;
  final TextEditingController controller;
  final int maxLines;
  final int maxLength;
  final TextAlign textAlign;
  final bool readOnly;

  TextFieldCustomWidget({
    Key key,
    this.labelText,
    this.onChanged,
    this.errorText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.autofocus = false,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return TextField(
        controller: controller,
        autofocus: autofocus,
        keyboardType: textInputType,
        style: TextStyle(fontSize: 20),
        onChanged: onChanged,
        obscureText: obscureText,
        maxLines: maxLines,
        maxLength: maxLength,
        textAlign: textAlign,
        readOnly: readOnly,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            hintText: labelText,
            filled: true,
            errorText: errorText == null ? null : errorText(),
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
      );
    });
  }
}
