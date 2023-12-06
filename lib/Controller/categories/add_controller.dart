import 'dart:io';

import 'package:adminapp/Controller/categories/view_controller.dart';
import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Core/function/uploadfile.dart';
import 'package:adminapp/Data/DataSource/remote/categories/Categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 CategoriesData categoriesData=CategoriesData(Get.find());
 File? file;
 late TextEditingController name;
 late TextEditingController namear;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();

 chooseImage()async{
  file=await fileUploadGallery();
  update();
 }

addData()async {
    if(formsate.currentState!.validate()){
      if(file==null)return Get.snackbar("Alert","Please choose Image SVG");
      Map data={
      "name":name.text,
      "namear":namear.text, };
   statusRequest=StatusRequest.loading;
   update();
    var response=await categoriesData.addCategoriesData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offNamed(RoutesApp.categoriesview);
      CategoriesViewController c=Get.find();
      c.getData();
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    name=TextEditingController();
    namear=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}