 

import 'dart:io';

import 'package:adminapp/Core/class/Crud.dart';
import 'package:adminapp/linkAPI.dart';
class ItemssData {
  Crud crud;
 ItemssData(this.crud);

  getItemsData()async{
     var response=await crud.postData(AppLinks.itemsview, {  });
    return response.fold((l) => l, (r) => r);
  }

addItemsData(Map data,File file)async{
     var response=await crud.addRequestWithImageOne(AppLinks.itemssadd, data,file);
    return response.fold((l) => l, (r) => r);
  }

editItemsData(Map data,[File? file])async{
     var response;
     if(file==null){
         response=await crud.postData(AppLinks.itemssedit, data);
     }else{
     response= await crud.addRequestWithImageOne(AppLinks.itemssedit, data,file);
     }
    return response.fold((l) => l, (r) => r);
  }

deleteItemsData(Map data)async{
     var response=await crud.postData(AppLinks.itemssdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  
 }
