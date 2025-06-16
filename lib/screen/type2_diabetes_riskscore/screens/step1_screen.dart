import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step2_screen.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => Step1ScreenState();
}

class Step1ScreenState extends State<Step1Screen> {
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
                  maxLines: 2,
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
                      "Step 1 of 8",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Age",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.headingcolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "How old are you?",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Column(
                      children:
                          List.generate(provider.ageOptions.length, (index) {
                        bool isSelected1 = provider.selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              provider.selectedIndex = index;
                            });
                          },
                          child: Button2(
                              buttoncolor: isSelected1
                                  ? AppColors.green
                                  : AppColors.white,
                              textcolor: isSelected1
                                  ? AppColors.white
                                  : AppColors.green,
                              subject: provider.ageOptions[index]),
                        );
                      }),
                    ),
                    sizedBoxWithHeight(10),
                    InkWell(
                      onTap: provider.selectedIndex != null
                          ? () {
                              // Navigate to next screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step2Screen()),
                              );
                            }
                          : null,
                      child: Container(
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
                            "Next",
                            style: GoogleFonts.roboto(
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
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
