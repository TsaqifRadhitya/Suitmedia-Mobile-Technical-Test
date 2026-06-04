import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomePrimaryButton extends StatelessWidget {
  final bool enable;
  final bool loading;
  final VoidCallback onPressed;
  final String label;
  const CustomePrimaryButton({
    super.key,
    this.enable = true,
    this.loading = false,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: loading
          ? () {}
          : enable
          ? onPressed
          : null,
      style: FilledButton.styleFrom(
        backgroundColor: Color(0xff2B637B),
        disabledBackgroundColor: Color(0xff2B637B).withValues(alpha: 0.4),
        disabledForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (loading)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
        ],
      ),
    );
  }
}
