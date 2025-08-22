import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step7_screen.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';

class Step6Screen extends StatefulWidget {
  const Step6Screen({super.key});

  @override
  State<Step6Screen> createState() => Step6ScreenState();
}

class Step6ScreenState extends State<Step6Screen> {
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
                      "Step 6 of 8",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Hypertension History",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.headingcolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Have you ever been diagnosed with high blood pressure?",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Column(
                      children: List.generate(
                          provider.hypertensionoptions.length, (index) {
                        bool isSelected = provider.selectedIndex3 == index;
                        return GestureDetector(
                          onTap: () {
                            provider.selectedIndex3 = index;
                            provider.notifyListeners();
                          },
                          child: Button2(
                              buttoncolor: isSelected
                                  ? AppColors.green
                                  : AppColors.white,
                              textcolor: isSelected
                                  ? AppColors.white
                                  : AppColors.green,
                              subject: provider.hypertensionoptions[index]),
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "High blood pressure is defined as 140/90 mmHg or higher, or if you're taking medication for it.",
                      maxLines: 3,
                      style: GoogleFonts.roboto(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    InkWell(
                        onTap: provider.selectedIndex3 != null
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Step7Screen()),
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
// import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
// import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
// import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/step7_screen.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';

// class Step6Screen extends StatefulWidget {
//   const Step6Screen({super.key});

//   @override
//   State<Step6Screen> createState() => Step6ScreenState();
// }

// class Step6ScreenState extends State<Step6Screen> {
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
//                       "Step 6 of 8",
//                       style: GoogleFonts.roboto(
//                         color: AppColors.grey,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Text(
//                       "Hypertension History",
//                       maxLines: 2,
//                       style: GoogleFonts.roboto(
//                         color: AppColors.headingcolor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     sizedBoxWithHeight(10),
//                     Text(
//                       "Have you ever been diagnosed with high blood pressure?",
//                       style: GoogleFonts.roboto(
//                         color: AppColors.black,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     sizedBoxWithHeight(10),
//                     Column(
//                       children: List.generate(
//                           provider.hypertensionoptions.length, (index) {
//                         bool isSelected = provider.selectedIndex3 == index;
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               provider.selectedIndex3 = index;
//                             });
//                           },
//                           child: Button2(
//                               buttoncolor: isSelected
//                                   ? AppColors.green
//                                   : AppColors.white,
//                               textcolor: isSelected
//                                   ? AppColors.white
//                                   : AppColors.green,
//                               subject: provider.hypertensionoptions[index]),
//                         );
//                       }),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Aim for at least 5 servings (e.g., 1 cup of fruits or vegetables counts as one serving).",
//                       maxLines: 3,
//                       style: GoogleFonts.roboto(
//                         color: AppColors.grey,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     sizedBoxWithHeight(10),
//                     InkWell(
//                         onTap: provider.selectedIndex3 != null
//                             ? () {
//                                 // Navigate to next screen
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const Step7Screen()),
//                                 );
//                               }
//                             : null,
//                         child: const Button1(subject: "Next")),
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
