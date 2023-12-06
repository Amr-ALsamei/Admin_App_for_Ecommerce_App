 
 import 'package:adminapp/Core/class/Crud.dart';
import 'package:adminapp/linkAPI.dart';
class PendingOrderData {
  Crud crud;
  PendingOrderData(this.crud);

  getPendingData()async{
     var response=await crud.postData(AppLinks.viewpendingorders, {  });
    return response.fold((l) => l, (r) => r);
  }
  approavPendingData(String orderid,String userid)async{
     var response=await crud.postData(AppLinks.approavorders, {
      "orderId":orderid.toString(),
      "userId":userid.toString(),
      
       });
    return response.fold((l) => l, (r) => r);
  }

  
 }
