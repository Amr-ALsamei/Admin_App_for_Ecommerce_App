import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Data/DataSource/remote/categories/Categories_data.dart';
import 'package:adminapp/Data/Model/categoriesModel.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController{

 List<CategoriesModel> categories=[];
 StatusRequest statusRequest=StatusRequest.None;
 CategoriesData categoriesData=CategoriesData(Get.find());

getData()async {
  categories.clear();
   statusRequest=StatusRequest.loading;
   update();
    var response=await categoriesData.getCategoriesData();
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List responsdata=response['data'];
      categories.addAll(responsdata.map((e) => CategoriesModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  
deletCategory(String catId,String imagname){
    categoriesData.deleteCategoriesData({
           "categoryId":catId.toString(),
           "imagename":imagname.toString(),
    });
    categories.removeWhere((element) => element.categoryID.toString()==catId);
    update();

  }
goToEditPage(CategoriesModel categoriesModel){
   Get.toNamed(RoutesApp.categoriesedit,arguments:{
    "categoriesModel":categoriesModel
   } );
}
  @override
  void onInit() {
   getData();
    // TODO: implement onInit
    super.onInit();
  }

 onMakeBack(){
  Get.offAllNamed(RoutesApp.adminhome);
  return Future.value(false);
 } 
}