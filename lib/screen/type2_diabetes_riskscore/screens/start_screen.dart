import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step1_screen.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Type2DiabetesController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
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
              Text(
                "Type 2 Diabetes Risk Score",
                maxLines: 2,
                style: GoogleFonts.roboto(
                  color: AppColors.titlecolor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
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
                      "Could You Be at Risk of Type 2 Diabetes?",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.headingcolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Answer a few simple questions to find out your 10-year risk. it takes less than 2 minutes.",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Step1Screen(),
                            ));
                      },
                      child: const Button1(
                        subject: "Enter My HbA1c Value",
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Row(
                      children: [
                        Checkbox(
                          value: provider.isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              provider.isChecked = newValue!;
                            });
                          },
                        ),
                        sizedBoxWithWidth(5),
                        Image.asset(
                            height: 14,
                            width: 14,
                            "assets/images/stars.png",
                            fit: BoxFit.contain),
                        sizedBoxWithWidth(5),
                        Expanded(
                          child: Text(
                            "Save data to your profile for personalized insights.",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
