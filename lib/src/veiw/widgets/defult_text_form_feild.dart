import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType? type;

  const CustomTextFormField({super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.type
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: type,
          decoration: InputDecoration(
            hintStyle:Theme.of(context).textTheme.headline1,
            hintText: hintText,
            isDense: true,
            border: InputBorder.none,
            suffixIcon: suffixIcon,
            
          ),
        ),
      ),
    );
  }
}