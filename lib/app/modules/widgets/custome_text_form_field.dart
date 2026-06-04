import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeTextFormField extends StatefulWidget {
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
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  String? _validatorError;

  @override
  Widget build(BuildContext context) {
    final displayError = widget.errorText ?? _validatorError;
    final errorValidator = widget.errorText == null && _validatorError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: errorValidator ? 50 : 40,
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (widget.validator != null) {
                final error = widget.validator!(value);
                setState(() {
                  _validatorError = error;
                });
                return error != null ? '' : null;
              }
              return null;
            },
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff04021D),
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.white,
              errorStyle: const TextStyle(
                height: 0,
                fontSize: 0,
                color: Colors.transparent,
              ),
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xff6867775C).withValues(alpha: 0.36),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 0.5,
                  color: Color(0xffE2E3E4),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 0.5,
                  color: Color(0xffE2E3E4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xffE2E3E4),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 1, color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 2, color: Colors.red),
              ),
            ),
          ),
        ),
        if (displayError != null && displayError.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              displayError,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
