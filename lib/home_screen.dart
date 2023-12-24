import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mast_detector/my_colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=false;
  late File _image;
  final imagePicker= ImagePicker();

  loadImage_gallery() async{
    var image=await imagePicker.pickImage(source: ImageSource.gallery);
    if(image==null){
      return null;
    }else{
      _image= File(image.path);
    }
  }

  loadImage_camera() async{
    var image=await imagePicker.pickImage(source: ImageSource.camera);
    if(image==null){
      return null;
    }else{
      _image= File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MyColors.primaryColor,
        title: Text('Face Mask Detector', style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 50.h,
              width: MediaQuery.sizeOf(context).width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: MyColors.primaryColor,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.primaryColor)
                ),
                onPressed: () {
                  loadImage_camera();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Camera", style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp
                    ),),
                    SizedBox(width: 20.w,),
                    Icon(CupertinoIcons.camera, color: Colors.white, size: 24,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Center(
            child: Container(
              height: 50.h,
              width: MediaQuery.sizeOf(context).width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: MyColors.primaryColor,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyColors.primaryColor)
                ),
                onPressed: () {
                  loadImage_gallery();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Gallery", style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp
                    ),),
                    SizedBox(width: 20.w,),
                    Icon(CupertinoIcons.photo, color: Colors.white, size: 24,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
