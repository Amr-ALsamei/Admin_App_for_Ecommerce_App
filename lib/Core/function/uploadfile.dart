import 'dart:io';

import 'package:adminapp/Core/constant/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadGallery()async{
  final XFile? file=await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 90);
  if(file !=null){
    return File(file.path);
  }

}

fileUploadGallery([isSvg=true])async{
  FilePickerResult? result= await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:isSvg? [
      "svg",
      "SVG",
    ]:[
      "png",
      "PNG",
      "jpg",
      "jpeg",
      "gif"
    ]
  );

  if(result !=null){
    return File(result.files.single.path!);
  }else{
    return null;
  }


}

ShowBottomMenu(imageuploadcamers(),imageuploadgallery()){
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.ltr,
       child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text("Choose Image",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Appcolors.primarycolor),),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: (){
                imageuploadcamers();
                Get.back();
              },
              title: Text("Image from camera",style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.camera_alt,size: 40,),
            ),

             ListTile(
              onTap: (){
                imageuploadgallery();
                Get.back();
              },
              title: Text("Image from Gallery",style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.image,size: 40,),
            )
          ],
        ),
       )
       ),
       backgroundColor: Colors.white
  );
  
}