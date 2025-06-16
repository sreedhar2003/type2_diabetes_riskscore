import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step6_screen.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';

class Step5Screen extends StatefulWidget {
  const Step5Screen({super.key});

  @override
  State<Step5Screen> createState() => Step5ScreenState();
}

class Step5ScreenState extends State<Step5Screen> {
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
                      "Step 5 of 8",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Daily Diet",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.headingcolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Do you eat fruits and vegetables daily?",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Column(
                      children:
                          List.generate(provider.dietOptions.length, (index) {
                        bool isSelected = provider.selectedIndex2 == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              provider.selectedIndex2 = index;
                            });
                          },
                          child: Button2(
                              buttoncolor: isSelected
                                  ? AppColors.green
                                  : AppColors.white,
                              textcolor: isSelected
                                  ? AppColors.white
                                  : AppColors.green,
                              subject: provider.dietOptions[index]),
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Aim for at least 5 servings (e.g., 1 cup of fruits or vegetables counts as one serving).",
                      maxLines: 3,
                      style: GoogleFonts.roboto(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    InkWell(
                        onTap: provider.selectedIndex2 != null
                            ? () {
                                // Navigate to next screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Step6Screen()),
                                );
                              }
                            : null,
                        child: const Button1(subject: "Next")),
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
