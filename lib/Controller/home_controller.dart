
import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Core/services/services.dart';
import 'package:adminapp/Data/DataSource/remote/categories/Categories_data.dart';
import 'package:adminapp/Data/Model/categoriesModel.dart';
import 'package:get/get.dart';

abstract class AdminHomeController extends GetxController{
 initialData();
 getData();
 goToItems(List categories,int SelectedCat,String categoryId);
}

 class AdminHomeControllerImp extends AdminHomeController{
   MyServices myServices=Get.find();
  String? username;
  String? id;
 StatusRequest statusRequest=StatusRequest.None;
 CategoriesData categoriesData=CategoriesData(Get.find());
 List items=[];
 List<CategoriesModel> categories=[];
 List textSetting=[];
 String? lang;

 

 @override
  initialData(){
  lang=myServices.sharedPref.getString("lang");
  username=myServices.sharedPref.getString("username");
  id=myServices.sharedPref.getString("Id");
  }

  
  
  @override
  getData()async {
   statusRequest=StatusRequest.loading;
   update();
    var response=await categoriesData.getCategoriesData();
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List responsdata=response['data'];
      categories.addAll(responsdata.map((e) => CategoriesModel.fromJson(e)));
        // categories.addAll(response['categories']['data']);
        // items.addAll(response['items']['data']);
        // textSetting.addAll(response['textsetting']['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }




   @override
  goToItems(categories,SelectedCat,categoryId) {
    // Get.toNamed(RoutesApp.items,arguments: {
    //   "Categories":categories,
    //   "SelectedCat":SelectedCat,
    //   "categoryid":categoryId,
    //   "userid":id
    // });
  }



  @override
  void onInit() {
    // searhitem=TextEditingController();
    
    initialData();
    getData();
    super.onInit();
  }
  
  // @override
  // getData() {
  //   // TODO: implement getHomData
  //   throw UnimplementedError();
  // }
  
 
}



