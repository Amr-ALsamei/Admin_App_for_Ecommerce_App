import 'package:adminapp/Core/class/Crud.dart';
import 'package:adminapp/linkAPI.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getData(int orderId)async{
     var response=await crud.postData(AppLinks.detailsorders, {
      "orderId":orderId.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }