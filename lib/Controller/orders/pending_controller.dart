
import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Core/services/services.dart';
import 'package:adminapp/Data/DataSource/remote/orders/pendingorder_data.dart';
import 'package:adminapp/Data/Model/ordersModel.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController{

 List<OrdersModel> data=[];
 StatusRequest statusRequest=StatusRequest.None;
 PendingOrderData pendingOrderData=PendingOrderData(Get.find());
 MyServices myServices=Get.find();

getPendingOrders()async {
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await pendingOrderData.getPendingData();
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      List respnseData=response['data'];
      data.addAll(respnseData.map((e) => OrdersModel.fromJson(e)));
      // print(data);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

  ApproavPendingOrders(String orderid,String userid)async {
   
    statusRequest=StatusRequest.loading;
    // update();
    var response=await pendingOrderData.approavPendingData(orderid,userid);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
       getPendingOrders();
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

//////////////////////////////
refreshOrder(){
  getPendingOrders();
}
///////////////////////////////
  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}