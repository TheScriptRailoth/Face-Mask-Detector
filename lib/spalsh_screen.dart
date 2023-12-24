
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_detector/home_screen.dart';
import 'package:mask_detector/my_colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomeScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/mask.png', fit: BoxFit.cover,),
              height: 80,
              width: 80,
            ),
            SizedBox(height: 10.h,),
            Text("Face Mask Detector", style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    );
  }
}
