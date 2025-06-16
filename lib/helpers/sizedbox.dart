import 'package:flutter/material.dart';
import 'package:type2_diabetes_riskscore/helpers/size_extensions.dart';

Widget sizedBoxWithHeight(int? height) {
  return SizedBox(
    height: height!.h,
  );
}

Widget sizedBoxWithWidth(int? width) {
  return SizedBox(
    width: width!.w,
  );
}
