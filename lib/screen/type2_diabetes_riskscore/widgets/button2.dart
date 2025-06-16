import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';

class Button2 extends StatelessWidget {
  final String subject;
  // final GestureTapCallback ontap;
  final Color buttoncolor;
  final Color textcolor;
  const Button2(
      {super.key,
      required this.subject,
      required this.buttoncolor,
      required this.textcolor
      //required this.ontap
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(82),
            color: AppColors.white,
            border: Border.all(color: AppColors.titlecolor)),
        child: Center(
          child: Text(
            subject,
            style: GoogleFonts.roboto(
              color: AppColors.green,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
