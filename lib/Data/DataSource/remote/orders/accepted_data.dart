import 'package:adminapp/Core/class/Crud.dart';
import 'package:adminapp/linkAPI.dart';

class AcceptedOrderData {
  Crud crud;
  AcceptedOrderData(this.crud);

  getData()async{
     var response=await crud.postData(AppLinks.viewacceptedorders, {
     
     });
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String orderid,String userid,String ordertype)async{
     var response=await crud.postData(AppLinks.prepareorders, {
      "orderId":orderid.toString(),
      "userId":userid.toString(),
      "Ordertype":ordertype.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }