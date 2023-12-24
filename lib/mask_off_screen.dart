import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';
class MaskOffScreen extends StatefulWidget {
  const MaskOffScreen({super.key});

  @override
  State<MaskOffScreen> createState() => _MaskOffScreenState();
}

class _MaskOffScreenState extends State<MaskOffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: MyColors.secondaryColor,
            child: Column(
              children: [
                SizedBox(height: 60.h,),
                Container(
                  height: 120.h,
                  width: 230.w,
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: Center(
                    child: Text(
                      "Wear you mask and\n Try Again!", style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/negative_image.png')
          )
        ],
      ),
    );
  }
}
