import 'dart:io';

import 'package:adminapp/Controller/Items/view_controller.dart';
import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Core/function/uploadfile.dart';
import 'package:adminapp/Data/DataSource/remote/Items_data.dart';
import 'package:adminapp/Data/DataSource/remote/categories/Categories_data.dart';
import 'package:adminapp/Data/Model/categoriesModel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 ItemssData itemssData=ItemssData(Get.find());
 File? file;
 late TextEditingController catId;
 late TextEditingController catName;
 List<SelectedListItem> dropdownlist=[];


 late TextEditingController name;
 late TextEditingController namear;
 late TextEditingController dropdownname;
 late TextEditingController dropdownid;
 late TextEditingController description;
 late TextEditingController descriptionar;
 late TextEditingController count;
 late TextEditingController price;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();

showOptionImage(){
  ShowBottomMenu(chooseImagecamera,chooseImagegallery);
}
 chooseImagecamera()async{
  file=await imageUploadGallery();
  update();
 }
 chooseImagegallery()async{
  file=await fileUploadGallery(false);
  update();
 }

addData()async {
    if(formsate.currentState!.validate()){
      if(file==null)return Get.snackbar("Alert","Please choose Image ");
      Map data={
      "categoryId":catId.text,
      "name":name.text,
      "namear":namear.text,
      "desc":description.text,
      "descar":descriptionar.text,
      "count":count.text, 
      "price":price.text};
   statusRequest=StatusRequest.loading;
   update();
    var response=await itemssData.addItemsData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offNamed(RoutesApp.itemsview);
      ItemsViewController c=Get.find();
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
    getCategories();
    name=TextEditingController();
    namear=TextEditingController();
    dropdownname=TextEditingController();
    dropdownid=TextEditingController();
     description=TextEditingController();
    descriptionar=TextEditingController();
    count=TextEditingController();
    price=TextEditingController();

     catId=TextEditingController();
    catName=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

///////////////////////////////////
getCategories()async {
  CategoriesData categoriesData=CategoriesData(Get.find());
  List<CategoriesModel> categories=[];
   statusRequest=StatusRequest.loading;
   update();
    var response=await categoriesData.getCategoriesData();
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List responsdata=response['data'];
      categories.addAll(responsdata.map((e) => CategoriesModel.fromJson(e)));
        for(int i=0;i<categories.length;i++){
          dropdownlist.add(SelectedListItem(name: categories[i].categoryName!,
                                  value:categories[i].categoryID.toString() ));
        }
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
/////////////////////////////////


}