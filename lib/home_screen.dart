import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_detector/mask_on_screen.dart';
import 'package:tflite_v2/tflite_v2.dart';

import 'mask_off_screen.dart';
import 'my_colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=true;
  late File _image;
  final imagePicker= ImagePicker();
  List _predictions=[];

  @override
  void initState(){
    super.initState();
    loadModel();
  }

  void dispose(){
    super.dispose();
  }

  detect_mask(File image)async{
    var prediction=await Tflite.runModelOnImage(path: image.path, numResults: 2, threshold: 0.6, imageMean: 127.5, imageStd: 127.5);
    setState(() {
      _predictions=prediction!;
      isLoading=false;
    });
    if(_predictions[0]['label'].toString().substring(2)=="Class 1"){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return MaskOnScreen();
      }));
    }
    else if(_predictions[0]['label'].toString().substring(2)=="Class 2"){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return MaskOffScreen();
      }));
    }
    else {print("Error");}
  }

  loadModel() async{
    await Tflite.loadModel(model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  loadImage_gallery() async{
    var image=await imagePicker.pickImage(source: ImageSource.gallery);
    if(image==null){
      return null;
    }else{
      _image= File(image.path);
    }
    detect_mask(_image);
  }

  loadImage_camera() async{
    var image=await imagePicker.pickImage(source: ImageSource.camera);
    if(image==null){
      return null;
    }else{
      _image= File(image.path);
    }
    detect_mask(_image);
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
          // isLoading?Container():Container(
          //   child: Text(_predictions[0]['label'].toString().substring(2)),
          // )
        ],
      ),
    );
  }
}
