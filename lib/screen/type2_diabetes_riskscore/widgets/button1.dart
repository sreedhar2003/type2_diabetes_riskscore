import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';

class Button1 extends StatelessWidget {
  final String subject;
  // final GestureTapCallback ontap;
  const Button1({
    super.key,
    required this.subject,
    // required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(82),
        gradient: const LinearGradient(
          colors: [
            AppColors.headingcolor,
            AppColors.titlecolor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          subject,
          style: GoogleFonts.roboto(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
