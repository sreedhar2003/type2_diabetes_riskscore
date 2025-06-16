import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/dummysemicircle_card.dart';

class RiskscoreScreen extends StatefulWidget {
  const RiskscoreScreen({super.key});

  @override
  State<RiskscoreScreen> createState() => RiskscoreScreenState();
}

class RiskscoreScreenState extends State<RiskscoreScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Type2DiabetesController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.black,
            ),
          ),
          title: Center(
            child: Text(
              "Type 2 Diabetes Risk Score",
              style: GoogleFonts.roboto(
                color: AppColors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Type 2 Diabetes Risk Score",
                      style: GoogleFonts.roboto(
                        color: AppColors.titlecolor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  sizedBoxWithHeight(40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.containercolor,
                      border: Border.all(
                        color: AppColors.titlecolor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Here’s Your Diabetes Risk",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.headingcolor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        SizedBox(
                          height: 150,
                          width: 250,
                          child: SemiCircleGauge(value: 0.6),
                        ),
                        sizedBoxWithHeight(20),
                        Text(
                          "Moderate Risk",
                          style: GoogleFonts.roboto(
                            color: AppColors.yellow,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          "Your 10-year risk of developing Type 2 diabetes is 15-30%.",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          "Your risk is moderate. Let’s build healthy habits together to reduce it.",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        InkWell(
                          onTap: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           ,
                            //     ));
                          },
                          child: const Button1(
                            subject: "Create a Prevention Plan",
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        const Button2(
                            subject: "Talk to a Doctor",
                            buttoncolor: AppColors.grey,
                            textcolor: AppColors.grey),
                        sizedBoxWithHeight(20),
                        const Button2(
                            subject: "Recalculate Later",
                            buttoncolor: AppColors.grey,
                            textcolor: AppColors.grey),
                        sizedBoxWithHeight(20),
                        const Button2(
                            subject: "Share With My Doctor",
                            buttoncolor: AppColors.grey,
                            textcolor: AppColors.grey),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
