import 'package:adminapp/Core/class/statusrequest.dart';
import 'package:adminapp/Core/function/handlingdata.dart';
import 'package:adminapp/Core/services/services.dart';
import 'package:adminapp/Data/DataSource/remote/orders/accepted_data.dart';
import 'package:adminapp/Data/Model/ordersModel.dart';
import 'package:get/get.dart';

class AcceptedOrdersController extends GetxController{

 List<OrdersModel> data=[];
 StatusRequest statusRequest=StatusRequest.None;
 AcceptedOrderData acceptedOrderData=AcceptedOrderData(Get.find());
 MyServices myServices=Get.find();

getAcceptedOrders()async {
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await acceptedOrderData.getData();
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

donePrepareOrders(String orderid,String userid,String type)async {
    
    statusRequest=StatusRequest.loading;
    update();
    var response=await acceptedOrderData.donePrepare(orderid,userid,type);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      // List respnseData=response['data'];
      // data.addAll(respnseData.map((e) => OrdersModel.fromJson(e)));
      // print(data);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

//////////////////////////////
refreshOrder(){
  getAcceptedOrders();
}
///////////////////////////////
  @override
  void onInit() {
    getAcceptedOrders();
    super.onInit();
  }
}