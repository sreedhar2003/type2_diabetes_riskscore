import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step4_screen.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/custom_textfield.dart';

class Step3Screen extends StatefulWidget {
  const Step3Screen({super.key});

  @override
  State<Step3Screen> createState() => Step3ScreenState();
}

class Step3ScreenState extends State<Step3Screen> {
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
                      "Step 3 of 8",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Waist Circumference",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.headingcolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "What is your waist measurement?",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      height: 158,
                      width: 254,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/waist_logo.png"),
                              fit: BoxFit.cover)),
                    ),
                    sizedBoxWithHeight(10),
                    Form(
                      key: provider.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextfield(
                              controller: provider.waistController,
                              hintText: "Waist (cm)"),
                          SizedBox(height: 10),
                          Text(
                            "Gender-specific cutoffs apply. For general guidance : Men > 102cm (40in), Women > 88cm (35in) are higher risk.",
                            maxLines: 3,
                            style: GoogleFonts.roboto(
                              color: AppColors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(10),
                          InkWell(
                            onTap: () {
                              if (provider.formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Step4Screen()),
                                );
                              }
                            },
                            child: const Button1(subject: "Next"),
                          )
                        ],
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


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
// import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
// import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
// import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step4_screen.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/custom_textfield.dart';

// class Step3Screen extends StatefulWidget {
//   const Step3Screen({super.key});

//   @override
//   State<Step3Screen> createState() => Step3ScreenState();
// }

// class Step3ScreenState extends State<Step3Screen> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<Type2DiabetesController>();
//     ScreenUtil.getInstance().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         surfaceTintColor: AppColors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             size: 20,
//             color: AppColors.black,
//           ),
//         ),
//         title: Center(
//           child: Text(
//             "Type 2 Diabetes Risk Score",
//             style: GoogleFonts.roboto(
//               color: AppColors.black,
//               fontSize: 17.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Text(
//                   "Type 2 Diabetes Risk Score",
//                   maxLines: 2,
//                   style: GoogleFonts.roboto(
//                     color: AppColors.titlecolor,
//                     fontSize: 30.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               sizedBoxWithHeight(40),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: AppColors.containercolor,
//                   border: Border.all(
//                     color: AppColors.titlecolor,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Step 3 of 8",
//                       style: GoogleFonts.roboto(
//                         color: AppColors.grey,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Text(
//                       "Waist Circumference",
//                       maxLines: 2,
//                       style: GoogleFonts.roboto(
//                         color: AppColors.headingcolor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     sizedBoxWithHeight(10),
//                     Text(
//                       "What is your waist measurement?",
//                       style: GoogleFonts.roboto(
//                         color: AppColors.black,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     sizedBoxWithHeight(10),
//                     Container(
//                       height: 158,
//                       width: 254,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: const DecorationImage(
//                               image: AssetImage("assets/images/waist_logo.png"),
//                               fit: BoxFit.cover)),
//                     ),
//                     sizedBoxWithHeight(10),
//                     Form(
//                       key: provider.formKey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomTextfield(
//                               controller: provider.waistController,
//                               hintText: "Waist (cm)"),
//                           SizedBox(height: 10),
//                           Text(
//                             "Gender-specific cutoffs apply. For general guidance : Mwn > 102cm (40in), Women <88cm (35in) are higher risk.",
//                             maxLines: 3,
//                             style: GoogleFonts.roboto(
//                               color: AppColors.grey,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           sizedBoxWithHeight(10),
//                           InkWell(
//                             onTap: () {
//                               if (provider.formKey.currentState!.validate()) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const Step4Screen()),
//                                 );
//                               }
//                             },
//                             child: const Button1(subject: "Next"),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }