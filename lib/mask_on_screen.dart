import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_detector/home_screen.dart';
import 'package:mask_detector/my_colors.dart';
class MaskOnScreen extends StatefulWidget {
  const MaskOnScreen({super.key});

  @override
  State<MaskOnScreen> createState() => _MaskOnScreenState();
}
class _MaskOnScreenState extends State<MaskOnScreen> {

  @override
  void initState(){
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomeScreen();
      }));
    });
  }
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
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(30.r)
                    ),
                    child: Center(
                      child: Text(
                        "Thank you for \n staying safe", style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                      ),
                      ),
                    ),
                  )
                ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
              child: Image.asset('assets/positive_image.png')
          )
        ],
      ),
    );
  }
}
