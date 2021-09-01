import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function validate;
  final TextInputType type;

  const DefaultTextFormField(
      {Key key, this.hintText, this.controller, this.validate, this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: '$hintText',
      ),
      controller: controller,
      validator: validate,
      keyboardType: type,
    );
  }
}
