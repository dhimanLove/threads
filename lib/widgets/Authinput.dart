import 'package:flutter/material.dart';
import 'package:threads/utils/type_def.dart';

class Authinput extends StatelessWidget {
  final String hintText,label;
  final ValidationCallback? validator;
  final bool isapasswordfield;
  final TextEditingController controller;
  const Authinput({
    required this.hintText,
    this.isapasswordfield=false,
    required this.label,
    required this.controller,
    super.key,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isapasswordfield,
      validator: validator,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Colors.grey
          ),
        ),
        hintText: hintText,
        label:Text(label) ,
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
