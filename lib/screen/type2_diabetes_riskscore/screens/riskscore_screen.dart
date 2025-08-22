import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';
import 'package:type2_diabetes_riskscore/helpers/screen_config.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';
import 'package:type2_diabetes_riskscore/helpers/sizedbox.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/controller/type2_diabetes_controller.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/screens/start_screen.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';
import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/dummysemicircle_card.dart';

class RiskscoreScreen extends StatefulWidget {
  const RiskscoreScreen({super.key});

  @override
  State<RiskscoreScreen> createState() => RiskscoreScreenState();
}

class RiskscoreScreenState extends State<RiskscoreScreen> {
  // Use a map to hold the risk data calculated from the controller.
  late Map<String, dynamic> riskData;

  @override
  void initState() {
    super.initState();
    // Use a post-frame callback to ensure the context is available before
    // accessing the provider.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Access the controller and calculate the risk score.
      final provider =
          Provider.of<Type2DiabetesController>(context, listen: false);
      riskData = provider.calculateRisk();
      // Manually trigger a rebuild to update the UI with the new data.
      setState(() {});
    });
  }

  // Helper function to get the appropriate color based on risk category
  Color getRiskColor(String category) {
    switch (category) {
      case "Low":
        return AppColors.green;
      case "Slightly Elevated":
        return AppColors.yellow;
      case "Moderate":
        return AppColors.orange;
      case "High":
        return AppColors.red;
      case "Very High":
        return AppColors.red;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    // Use a consumer to automatically rebuild the widget when the controller changes.
    return Consumer<Type2DiabetesController>(
      builder: (context, provider, child) {
        // Recalculate the risk data inside the builder to ensure it's up to date.
        // This is safe because it only happens on rebuilds.
        riskData = provider.calculateRisk();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            leading: IconButton(
              onPressed: () {
                provider.resetCalculator();
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
                          // Pass the calculated risk percentage, converted to a value between 0.0 and 1.0,
                          // to the SemiCircleGauge.
                          child: SemiCircleGauge(
                              value: (riskData['riskPercent'] ?? 0) / 100),
                        ),
                        sizedBoxWithHeight(20),
                        Text(
                          // Use the dynamic risk category from the controller.
                          "${riskData['riskCategory'] ?? 'N/A'} Risk",
                          style: GoogleFonts.roboto(
                            // Dynamically set the color based on the risk category.
                            color: getRiskColor(riskData['riskCategory'] ?? ''),
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          // Use the dynamic risk percentage from the controller.
                          "Your 10-year risk of developing Type 2 diabetes is ${riskData['riskPercent'] ?? 'N/A'}%.",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          "Your risk is ${riskData['riskCategory']?.toLowerCase() ?? 'N/A'}. Let’s build healthy habits together to reduce it.",
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
                            // Implement the action for "Create a Prevention Plan"
                          },
                          child: const Button1(
                            subject: "Create a Prevention Plan",
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        const Button2(
                          subject: "Talk to a Doctor",
                          buttoncolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                        sizedBoxWithHeight(20),
                        InkWell(
                          onTap: () {
                            provider.resetCalculator();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StartScreen(),
                                ));
                          },
                          child: const Button2(
                            subject: "Recalculate Later",
                            buttoncolor: AppColors.grey,
                            textcolor: AppColors.grey,
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        const Button2(
                          subject: "Share With My Doctor",
                          buttoncolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button1.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/button2.dart';
// import 'package:type2_diabetes_riskscore/screen/type2_diabetes_riskscore/widgets/dummysemicircle_card.dart';

// class RiskscoreScreen extends StatefulWidget {
//   const RiskscoreScreen({super.key});

//   @override
//   State<RiskscoreScreen> createState() => RiskscoreScreenState();
// }

// class RiskscoreScreenState extends State<RiskscoreScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<Type2DiabetesController>();
//     ScreenUtil.getInstance().init(context);
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.white,
//           surfaceTintColor: AppColors.white,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//               size: 20,
//               color: AppColors.black,
//             ),
//           ),
//           title: Center(
//             child: Text(
//               "Type 2 Diabetes Risk Score",
//               style: GoogleFonts.roboto(
//                 color: AppColors.black,
//                 fontSize: 17.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Text(
//                       "Type 2 Diabetes Risk Score",
//                       style: GoogleFonts.roboto(
//                         color: AppColors.titlecolor,
//                         fontSize: 30.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   sizedBoxWithHeight(40),
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: AppColors.containercolor,
//                       border: Border.all(
//                         color: AppColors.titlecolor,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Here’s Your Diabetes Risk",
//                           maxLines: 2,
//                           style: GoogleFonts.roboto(
//                             color: AppColors.headingcolor,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         sizedBoxWithHeight(10),
//                         SizedBox(
//                           height: 150,
//                           width: 250,
//                           child: SemiCircleGauge(value: 0.6),
//                         ),
//                         sizedBoxWithHeight(20),
//                         Text(
//                           "Moderate Risk",
//                           style: GoogleFonts.roboto(
//                             color: AppColors.yellow,
//                             fontSize: 30.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         sizedBoxWithHeight(10),
//                         Text(
//                           "Your 10-year risk of developing Type 2 diabetes is 15-30%.",
//                           maxLines: 2,
//                           style: GoogleFonts.roboto(
//                             color: AppColors.black,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         sizedBoxWithHeight(10),
//                         Text(
//                           "Your risk is moderate. Let’s build healthy habits together to reduce it.",
//                           maxLines: 2,
//                           style: GoogleFonts.roboto(
//                             color: AppColors.black,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         sizedBoxWithHeight(20),
//                         InkWell(
//                           onTap: () {
//                             // Navigator.pushReplacement(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //       builder: (context) =>
//                             //           ,
//                             //     ));
//                           },
//                           child: const Button1(
//                             subject: "Create a Prevention Plan",
//                           ),
//                         ),
//                         sizedBoxWithHeight(20),
//                         const Button2(
//                             subject: "Talk to a Doctor",
//                             buttoncolor: AppColors.grey,
//                             textcolor: AppColors.grey),
//                         sizedBoxWithHeight(20),
//                         const Button2(
//                             subject: "Recalculate Later",
//                             buttoncolor: AppColors.grey,
//                             textcolor: AppColors.grey),
//                         sizedBoxWithHeight(20),
//                         const Button2(
//                             subject: "Share With My Doctor",
//                             buttoncolor: AppColors.grey,
//                             textcolor: AppColors.grey),
//                       ],
//                     ),
//                   ),
//                 ]),
//           ),
//         ));
//   }
// }