import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/constant/routesName.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Data/DataSource/remote/Items_data.dart';
import 'package:adminapp/Data/Model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController{

 List<ItemModel> itemslist=[];
 StatusRequest statusRequest=StatusRequest.None;
 ItemssData itemssData=ItemssData(Get.find());

getData()async {
  itemslist.clear();
   statusRequest=StatusRequest.loading;
   update();
    var response=await itemssData.getItemsData();
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List responsdata=response['data'];
      itemslist.addAll(responsdata.map((e) => ItemModel.fromJson(e)));
        
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  
deletItem(String itemId,String imagname){
    itemssData.deleteItemsData({
           "itemId":itemId.toString(),
           "imagename":imagname.toString(),
    });
    itemslist.removeWhere((element) => element.itemID.toString()==itemId);
    update();

  }
goToEditPage(ItemModel itemModel){
   Get.toNamed(RoutesApp.itemsedit,arguments:{
    "itemsModel":itemModel
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