import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.pink, Colors.red], // Couleurs du dégradé
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32), // Coins arrondis
      ),
      child: Material(
        color: Colors.transparent, // Pour éviter de masquer le dégradé
        child: InkWell(
          borderRadius: BorderRadius.circular(32), // Coins cliquables arrondis
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 70.w),
            child: Center(
              child: Text(
                'Follow',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white, // Couleur du texte
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
