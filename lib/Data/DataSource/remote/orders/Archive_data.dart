 
 import 'package:adminapp/Core/class/Crud.dart';
import 'package:adminapp/linkAPI.dart';
class ArchiveOrderData {
  Crud crud;
  ArchiveOrderData(this.crud);

  getArchiveData()async{
     var response=await crud.postData(AppLinks.archiveorders, {
      
     });
    return response.fold((l) => l, (r) => r);
  }

  // RatingOrdersData(String orderid,String comment,String rate)async{
  //    var response=await crud.postData(AppLinks.orderrating, {
  //     "orderId":orderid.toString(),
  //     "comment":comment.toString(),
  //     "rating": rate.toString()
  //    });
  //   return response.fold((l) => l, (r) => r);
  // }

  
 }
