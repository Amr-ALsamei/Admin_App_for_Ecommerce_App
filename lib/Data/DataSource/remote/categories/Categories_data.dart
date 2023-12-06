 

import 'dart:io';

import 'package:adminapp/Core/class/Crud.dart';
import 'package:adminapp/linkAPI.dart';
class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getCategoriesData()async{
     var response=await crud.postData(AppLinks.categoriesview, {  });
    return response.fold((l) => l, (r) => r);
  }

addCategoriesData(Map data,File file)async{
     var response=await crud.addRequestWithImageOne(AppLinks.categoriesadd, data,file);
    return response.fold((l) => l, (r) => r);
  }

editCategoriesData(Map data,[File? file])async{
     var response;
     if(file==null){
         response=await crud.postData(AppLinks.categoriesedit, data);
     }else{
     response= await crud.addRequestWithImageOne(AppLinks.categoriesedit, data,file);
     }
    return response.fold((l) => l, (r) => r);
  }

deleteCategoriesData(Map data)async{
     var response=await crud.postData(AppLinks.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  
 }
