import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final String? errorText;
  const CustomeTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: const Color(0xff6867775C),
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        errorText: errorText,
        fillColor: Colors.white,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xff6867775C).withValues(alpha: 0.36),
        ),
        contentPadding: EdgeInsets.only(right: 16, left: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 0.5, color: const Color(0xffE2E3E4)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 0.5, color: const Color(0xffE2E3E4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2, color: const Color(0xffE2E3E4)),
        ),
      ),
    );
  }
}
